class Brand{
  int? id;
  String? brandName , imageLink ;

  Brand(this.id, this.brandName, this.imageLink);

  Brand.fromJson(Map<String , dynamic> jsonObject){
    this.id = jsonObject['id'];
    this.brandName = jsonObject['brand_name'];
    this.imageLink = jsonObject['image_link'];
  }
}