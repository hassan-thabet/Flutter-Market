
class Category{

  int id;
  String categoryName , imageLink;

  Category(this.id, this.categoryName , this.imageLink);

  Category.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.categoryName = jsonObject['category_name'];
    this.imageLink = jsonObject['image_link'];
  }
}

