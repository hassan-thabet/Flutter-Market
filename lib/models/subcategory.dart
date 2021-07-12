class Subcategory {
  int? id, categoryId;
  String? subcategoryName, imageLink;

  Subcategory(this.id, this.categoryId, this.subcategoryName, this.imageLink);

  Subcategory.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.subcategoryName = jsonObject['subcategory_name'];
    this.imageLink = jsonObject['image_link'];
    this.categoryId = jsonObject['category_id'];
  }
}
