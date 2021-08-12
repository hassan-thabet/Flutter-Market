import 'package:flutter/material.dart';
class ReviewComponentShimmer extends StatelessWidget {
  const ReviewComponentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 20,backgroundColor: Colors.white, foregroundColor: Colors.white,),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(16),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
