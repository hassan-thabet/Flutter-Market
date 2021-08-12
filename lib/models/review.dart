
import 'package:flutter_store/models/user.dart';

class Review{
  int? id ;
  var rate;
  User? userId;
  String? comment;

  Review(this.id, this.rate, this.userId, this.comment);


  Review.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.rate = jsonObject['rate'];
    this.comment = jsonObject['comment'];
    this.userId = User.fromJson(jsonObject['user_id']);
  }
}