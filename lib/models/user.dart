class User {
  int? id, phoneNumber;
  String? firstName, lastName, email, image, apiToken;

  User(this.id, this.firstName, this.lastName, this.email, this.phoneNumber,
      this.image, this.apiToken);

  User.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.firstName = jsonObject['first_name'];
    this.lastName = jsonObject['last_name'];
    this.email = jsonObject['email'];
    this.phoneNumber = jsonObject['phone_number'];
    this.image = jsonObject['image'];
    this.apiToken = jsonObject['api_token'];
  }
}
