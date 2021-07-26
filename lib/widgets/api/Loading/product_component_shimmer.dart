import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductComponentShimmer extends StatelessWidget {
  const ProductComponentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Container(
              width: 200,
              height: 180,
              color: Colors.white,
            ),
          Divider(color: Colors.black,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 8.0,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0 , horizontal: 4),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0 , horizontal: 4),
                ),
                Container(
                  width: 170,
                  height: 8.0,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0 , horizontal: 4),
                ),
                Container(
                  width: 170,
                  height: 8.0,
                  color: Colors.white,
                ),
                Spacer(),
                Row(

                  children: [
                    Container(
                      width: 40,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 40,),
                    Row(
                      children: [
                        Icon(Icons.star , color: Colors.white,size: 20,),
                        Icon(Icons.star , color: Colors.white,size: 20,),
                        Icon(Icons.star , color: Colors.white,size: 20,),
                        Icon(Icons.star , color: Colors.white,size: 20,),
                        Icon(Icons.star , color: Colors.white,size: 20,),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 4),
                  child: Container(
                    width: 190,
                    height: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}