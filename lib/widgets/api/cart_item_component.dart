import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/cart.dart';
import 'package:flutter_store/utilities/api_helper.dart';

Widget cartItemComponent(CartItem cartItem)
{
  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                      image: NetworkImage((ApiHelper.MAIN_IMAGES_URL + cartItem.product!.images![0])))),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 8, top: 4),
                      child: Text(
                        cartItem.product!.title.toString(),
                        maxLines: 2,
                        softWrap: true,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        cartItem.product!.type.toString(),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            cartItem.product!.price.toString() + ' LE',
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // flex: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.M_app_main_color,
                      child: Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.white,

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          bottom: 2, right: 10, left: 12),
                      child: Text(
                        cartItem.quantity!.toStringAsFixed(0),

                        // cartItem.quantity!.toString(), // more than 1
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.M_dark_text_color,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.M_app_main_color,
                      child: Icon(
                        Icons.remove,
                        size: 24,
                        color: Colors.white,

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      // Align(
      //   alignment: Alignment.topRight,
      //   child: Container(
      //     width: 24,
      //     height: 24,
      //     alignment: Alignment.center,
      //     margin: EdgeInsets.only(right: 10, top: 8),
      //     child: Icon(
      //       Icons.close,
      //       color: Colors.white,
      //       size: 20,
      //     ),
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(4)),
      //         color: Colors.red),
      //   ),
      // ),
    ],
  );
}

