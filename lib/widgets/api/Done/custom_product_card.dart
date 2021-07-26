

import 'package:flutter/material.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/product.dart';

Widget customProductCard(Product product)
{
  return Card(
    elevation: 4 ,
    child: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(child: Image.network(ApiHelper.MAIN_IMAGES_URL + product.images![0])),
          Divider(),
          Expanded(
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      child: Text(
                        product.type.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Quicksand',
                        ),
                      ) ,
                      alignment: Alignment.topLeft,),
                    Text(product.title.toString() , maxLines: 2,),
                    Spacer(),
                    Row(
                      children: [
                        Text(product.price.toString() + ' LE'),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: AppColors.M_app_main_color,
                            child: Icon(Icons.add_shopping_cart , color: Colors.white,size: 15,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2 , bottom: 2 , left: 2),
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: AppColors.M_app_main_color,
                            child: Icon(Icons.favorite_border_sharp , color: Colors.white, size: 15,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),

        ],
      ),
    ),
  );
}