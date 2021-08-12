
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/review.dart';
import 'package:flutter_store/widgets/ui/rate_bar.dart';
import 'package:intl/intl.dart';



Widget reviewComponent(Review review) {
  return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(review.userId!.image.toString()),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(16),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                review.userId!.firstName.toString() + ' ' + review.userId!.lastName.toString(),
                                  style: TextStyle(
                                    color: AppColors.M_semi_dark_text_color,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Spacer(),
                            Text('( ' + review.rate.toString() + ' )' , style: TextStyle(fontFamily: 'Quicksand',fontSize: 14)),
                            SizedBox(width: 4),
                            RateBar(review.rate!.toDouble()),


                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          review.comment.toString(),
                          style: TextStyle(
                            color: AppColors.M_semi_dark_text_color,
                            decoration: TextDecoration.none,
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
  );
}