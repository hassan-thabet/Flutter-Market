import 'package:flutter/cupertino.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:flutter/material.dart';

Widget searchItemComponent(Product product)
{
  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16 , bottom: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(
                  right: 8, left: 8, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                      image: NetworkImage((ApiHelper.MAIN_IMAGES_URL +
                          product.images![0])))),
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
                        product.title.toString(),
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        product.type.toString(),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product.price.toString() + ' LE',
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    ],
  );}
