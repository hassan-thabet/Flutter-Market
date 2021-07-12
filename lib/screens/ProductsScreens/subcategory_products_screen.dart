
import 'package:flutter/material.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/models/subcategory.dart';
import 'package:flutter_store/screens/product_screen.dart';
import 'package:flutter_store/widgets/api/product_component.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';

class SubcategoryProductsScreen extends StatefulWidget {

  const SubcategoryProductsScreen
      ({Key? key, required this.subcategory}) : super(key: key);
  final Subcategory subcategory;

  @override
  _SubcategoryProductsScreenState createState() => _SubcategoryProductsScreenState();
}
ProductsApi productsApi = new ProductsApi();


class _SubcategoryProductsScreenState extends State<SubcategoryProductsScreen> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void _goToProductScreen(Product product, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductScreen(product: product);
      }));
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.M_icons_color, //change your color here
        ),
        centerTitle: true,
        title: Text(
          widget.subcategory.subcategoryName! ,
          style: TextStyle(
            color: AppColors.M_dark_text_color ,
            fontFamily: 'Quicksand',
            letterSpacing: 1.7,
          ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            width: width,
            height: height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Subcategories',
                    style: TextStyle(
                      color: AppColors.M_semi_dark_text_color,
                      decoration: TextDecoration.none,
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    height: 360,
                    width: width,
                    child: FutureBuilder(
                        future: productsApi.fetchProductsBySubcategory(widget.subcategory.id.toString()),
                        builder: (BuildContext context , AsyncSnapshot<List<Product>> snapShot){

                          switch(snapShot.connectionState) {
                            case ConnectionState.none:
                              return error('nothing happened');

                            case ConnectionState.waiting:
                              return loading();

                            case ConnectionState.active:
                              return loading();

                            case ConnectionState.done:
                              if(snapShot.hasError){
                                return error(snapShot.error.toString());
                              }else{
                                if(snapShot.data!.length == 0){
                                  return Center(
                                    child: Text(
                                      'We will be adding more products soon in this section wait for us',
                                      style: TextStyle(
                                        color: AppColors.M_semi_dark_text_color,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Quicksand',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }else{
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapShot.data!.length,
                                      itemBuilder: (context, position) {
                                        return GestureDetector(
                                            onTap: () {
                                              _goToProductScreen(
                                                  snapShot.data![position],
                                                  context);
                                            },
                                            child: productComponent(snapShot.data![position])
                                        );
                                      }
                                  );
                                }
                              }
                          }

                        }
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
