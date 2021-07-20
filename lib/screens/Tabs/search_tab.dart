import 'package:flutter/material.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/widgets/components/floating_search_bar.dart';


class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}


class _SearchTabState extends State<SearchTab> {
  ProductsApi productsApi = new ProductsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildFloatingSearchBar(context),

          ],
        ),
      ),
    );
  }


}