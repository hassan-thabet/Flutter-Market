
import 'package:flutter/material.dart';
class CustomProductCardShimmer extends StatelessWidget {
  const CustomProductCardShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                ),
                Container(
                  width: 80,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                ),
                Container(
                  width: 100,
                  height: 8.0,
                  color: Colors.white,
                ),
                Spacer(),
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
          ),
        ],
      ),
    );
  }
}