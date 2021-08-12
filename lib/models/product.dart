class Product {
  int? id;
  int? subcategoryId , reviewsCount;
  String? title, description, type, status , details;
  double? price ;
  var rateAvg;
  List<String>? images;


  Product(this.id, this.price, this.subcategoryId, this.title, this.description,
      this.type, this.status, this.images , this.rateAvg , this.details, this.reviewsCount);

  Product.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.details = jsonObject['details'];
    this.type = jsonObject['type'];
    this.price = jsonObject['price'];
    this.status = jsonObject['status'];
    this.rateAvg = jsonObject['rate_avg'];
    this.reviewsCount = jsonObject['reviews_count'];
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
