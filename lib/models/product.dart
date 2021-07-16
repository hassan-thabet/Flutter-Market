class Product {
  int? id;
  int? subcategoryId;
  String? title, description, type, status;
  double? price;
  List<String>? images;

  Product(this.id, this.price, this.subcategoryId, this.title, this.description,
      this.type, this.status, this.images);

  Product.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.type = jsonObject['type'];
    this.price = jsonObject['price'];
    this.status = jsonObject['status'];
    this.subcategoryId = jsonObject['subcategory_id'];
    _setImages(jsonObject['images']);
  }
  void _setImages(List<dynamic> jsonImages) {
    images = [];
    if (jsonImages.length > 0) {
      for (var image in jsonImages) {
        if (images != null) {
          this.images!.add(image['path']);
        }
      }
    }
  }
}
