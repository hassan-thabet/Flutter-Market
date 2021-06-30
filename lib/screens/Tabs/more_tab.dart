
import 'package:flutter/material.dart';
class MoreTab extends StatefulWidget {

  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(child: Center(child: Text('More Content'),),),
      ],
    );
  }
}
