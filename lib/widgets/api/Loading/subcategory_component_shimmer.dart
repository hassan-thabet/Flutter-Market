import 'package:flutter/material.dart';


class SubcategoryComponentShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 25,
            width: 30,
            color: Colors.white,
          ),
          SizedBox(width: 12),
          Container(
            width: 200,
            height: 8.0,
            color: Colors.white,
          ),
          SizedBox(width: 12),
          Container(
            height: 10,
            width: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
