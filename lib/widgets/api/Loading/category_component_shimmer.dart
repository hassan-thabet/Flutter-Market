import 'package:flutter/material.dart';

class CategoryComponentShimmer extends StatelessWidget {
  const CategoryComponentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Flexible(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              // backgroundImage: NetworkImage(category.imageLink),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0 , left: 4),
            child: Container(
              width: 50,
              height: 8.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}