
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {

  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(child: Center(child: Text('Cart Content'),),),
      ],
    );
  }
}