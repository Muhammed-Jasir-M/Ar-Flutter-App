import 'package:ar_flutter_plugin_flutterflow/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_flutterflow/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_flutterflow/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_flutterflow/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_flutterflow/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_flutterflow/models/ar_node.dart';
import 'package:ar_flutter_plugin_flutterflow/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

/// This displays an AR scene with the ability to load 3D objects.
class ARObjectsScreen extends StatefulWidget {
  const ARObjectsScreen({
    super.key,
    required this.object,
    required this.isLocal,
  });

  final String object; // The path/URL of the 3D model
  final bool isLocal; // Determines whether the object is local or from the web

  @override
  State<ARObjectsScreen> createState() => _ARObjectsScreenState();
}

class _ARObjectsScreenState extends State<ARObjectsScreen> {
  late ARSessionManager arSessionManager; // Manages AR session lifecycle
  late ARObjectManager arObjectManager; // Handles adding/removing objects in AR

  ARNode? localObjectNode; // Stores the local 3D model node
  ARNode? webObjectNode; // Stores the web 3D model node

  bool isAdd =
      false; // Tracks whether an object is currently added to the AR scene

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7f9),
      appBar: AppBar(),
      body: ARView(onARViewCreated: onARViewCreated),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.isLocal
            ? onLocalObjectButtonPressed // Loads local model if true
            : onWebObjectAtButtonPressed, // Loads web model if false
        child: Icon(isAdd ? Icons.remove : Icons.add),
      ),
    );
  }

  /// Called when the AR view is created. Initializes AR session and managers.
  void onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    // Assign session and object managers
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    // Initialize AR session settings
    this.arSessionManager.onInitialize(
          showFeaturePoints:
              false, // Hides feature points (small tracking dots)
          showPlanes: true, // Shows detected planes
          customPlaneTexturePath: "assets/triangle.png",
          showWorldOrigin: true, // Shows the world origin (0,0,0)
          handleTaps: false, // Disables object tap interactions
        );

    // Initialize object manager for handling AR objects
    this.arObjectManager.onInitialize();
  }

  Future onLocalObjectButtonPressed() async {
    if (localObjectNode != null) {
      // Remove the object if it's already added
      arObjectManager.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      var newNode = ARNode(
        type: widget.object.endsWith('.gltf')
            ? NodeType.localGLTF2
            : NodeType.fileSystemAppFolderGLB,
        uri: widget.object, // Path to the local file
        scale: Vector3(0.2, 0.2, 0.2), // Adjusts the size of the model
        position: Vector3(0.0, 0.0, 0.0), // Placing the model at origin
        rotation: Vector4(1.0, 0.0, 0.0, 0.0), // Default rotation
      );
      // Adds the local 3D model to the AR scene
      bool? didAddLocalNode = await arObjectManager.addNode(newNode);
      // Stores the node if it was added successfully
      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }

  Future onWebObjectAtButtonPressed() async {
    // Toggles the add/remove state of the object
    setState(() {
      isAdd = !isAdd;
    });

    if (webObjectNode != null) {
      // Remove the object if it's already added
      arObjectManager.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      var newNode = ARNode(
        type: NodeType.webGLB, // Web-hosted 3D model format
        uri: widget.object, // URL of the model
        scale: Vector3(0.2, 0.2, 0.2), // Adjusts the size of the model
      );
      // Adds the web 3D model to the AR scene
      bool? didAddWebNode = await arObjectManager.addNode(newNode);
      // Stores the node if it was added successfully
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }

  /// Cleans up the AR session when the screen is closed.
  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }
}
