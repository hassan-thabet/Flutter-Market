
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(child: Center(child: Text('Profile Content'),),),
      ],
    );
  }
}
