
class ShopCardModel {
  final String image;
  final String title;
  final String description;
  bool isActive = false;
  final String object;
  final bool isLocal;

  ShopCardModel(
    this.image,
    this.title,
    this.description,
    this.isActive,
    this.object,
    this.isLocal,
  );
}
