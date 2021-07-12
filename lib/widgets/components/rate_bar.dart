import 'package:flutter/material.dart';
class RateBar extends StatelessWidget {
  const RateBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star , color: Colors.amberAccent, size: 20,),
        Icon(Icons.star, color: Colors.amberAccent,size: 20,),
        Icon(Icons.star, color: Colors.amberAccent,size: 20,),
        Icon(Icons.star_half, color: Colors.amberAccent,size: 20,),
        Icon(Icons.star_border, color: Colors.amberAccent , size: 20),
      ],
    );
  }
}