import 'package:flutter/material.dart';
import 'package:flutter_store/widgets/components/floating_search_bar.dart';



class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}


class _SearchTabState extends State<SearchTab> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          // alignment: AlignmentDirectional.topCenter,
          children: [
            buildFloatingSearchBar(context),
          ],
        ),

      ),
    );
  }


}