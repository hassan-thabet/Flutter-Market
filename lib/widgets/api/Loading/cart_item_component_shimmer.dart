
import 'package:flutter/material.dart';
class CartItemComponentShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),
            SizedBox(width : 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 140,
                    height: 3,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 140,
                    height: 4,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 150,
                    height: 4,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 80,
                    height: 4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
