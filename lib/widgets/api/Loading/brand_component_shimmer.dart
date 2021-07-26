import 'package:flutter/material.dart';

class BrandComponentShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 40,
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Container(
              width: 55,
              height: 6,
              color: Colors.white,
            ),
          ],
        )
    );
  }
}
