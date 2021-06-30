
class ResourcesNotFound implements Exception{

  String message;

  ResourcesNotFound(this.message);

  @override
  String toString() {
    return "${this.message} Not Found" ;
  }
}

class MissingFields implements Exception{
  @override
  String toString() {
    return"Missing Fields" ;
  }
}

class LoginField implements Exception{
  String message;

  LoginField(this.message);

  @override
  String toString() {
    return"${this.message}" ;
  }
}