import 'package:flutter/material.dart';
import 'package:flutter_store/api/reviews_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


ReviewsApi reviewsApi = ReviewsApi();
double rate = 5;
TextEditingController commentController = TextEditingController();

void addReviewBottomSheet(BuildContext context , int? productID) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Your opinion matters',
                style: TextStyle(
                  color: AppColors.M_semi_dark_text_color,
                  decoration: TextDecoration.none,
                  fontFamily: 'Quicksand',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rate = rating;
                  print(rating);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: commentController,
                  style: TextStyle(
                    color: AppColors.M_dark_text_color,
                    decoration: TextDecoration.none,
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: new InputDecoration(
                    labelText: 'Your comment',
                    labelStyle: TextStyle(
                      color: AppColors.M_semi_dark_text_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              TextButton(
                  child: Text('Submit'),
                  onPressed: () async
                  {
                    await reviewsApi.createReview(productID! , rate.toDouble() , commentController.text.toString());
                  },
              )
            ],
          ),
        );
      });
}
