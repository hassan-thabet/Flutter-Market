import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:flutter_store/widgets/UI/rate_bar.dart';

Widget productComponent(Product product) {

  return Card(
    elevation: 2,
    child: Container(
       width: 220,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Image.network(
                  ApiHelper.MAIN_IMAGES_URL + product.images![0],
                  height: 200 ,
                  width: double.infinity,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: (){},
                      child: Icon(Icons.favorite_border_outlined ,
                      color: AppColors.M_app_main_color,),
                  )
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              child: Text(
                product.type!,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                ),
              ) ,
              alignment: Alignment.topLeft,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              child: Text(
                product.title!,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                ),
              ) ,
              alignment: Alignment.topLeft,),
          ),

          Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price.toString() + ' LE',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  RateBar(),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.M_app_main_color)),
                  onPressed: (){},
                  child: Text(
                    'add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                    ),
                  ) ,
              ),
            ),
          ),

        ],
      ),
    ),
  );

}