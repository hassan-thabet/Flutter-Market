
import 'package:flutter/material.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/utilities/api_helper.dart';

class ProductScreen extends StatefulWidget {

  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: Container(child: Image.network(ApiHelper.MAIN_IMAGES_URL + widget.product.images[0])),
    );
  }
}
