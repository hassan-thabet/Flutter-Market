import 'package:flutter/material.dart';
import 'package:flutter_store/api/brands_api.dart';
import 'package:flutter_store/api/categories_api.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/category.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/widgets/api/category_component.dart';
import 'package:flutter_store/widgets/api/product_component.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';
import '../category_screen.dart';
import '../product_screen.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CategoriesApi categoriesApi = new CategoriesApi();
  BrandsApi brandsApi = new BrandsApi();
  ProductsApi productsApi = new ProductsApi();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void _goToCategoryScreen(Category category, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CategoryScreen(category: category);
      }));
    }

    void _goToProductScreen(Product product, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductScreen(product: product);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: AppColors.M_icons_color,
        ),
        title: Text(
          'MARKET',
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.notifications_active_outlined,
              color: AppColors.M_icons_color,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: height / 50,
              ),
              // Categories Text
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Categories',
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
              // categories horizontal list view
              Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Container(
                    height: 90,
                    width: width,
                    child: FutureBuilder(
                        future: categoriesApi.fetchCategories(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Category>> snapShot) {
                          switch (snapShot.connectionState) {
                            case ConnectionState.none:
                              return error('nothing happened');

                            case ConnectionState.waiting:
                              return loading();

                            case ConnectionState.active:
                              return loading();

                            case ConnectionState.done:
                              if (snapShot.hasError) {
                                return error(snapShot.error.toString());
                              } else {
                                if (!snapShot.hasData) {
                                  return error('No data is recorded on DB');
                                } else {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapShot.data!.length,
                                      itemBuilder: (context, position) {
                                        return GestureDetector(
                                            onTap: () {
                                              _goToCategoryScreen(
                                                  snapShot.data![position],
                                                  context);
                                            },
                                            child: categoryComponent(
                                                snapShot.data![position]));
                                      });
                                }
                              }
                          }
                        }),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Products',
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
                        future: productsApi.fetchProducts(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Product>> snapShot) {
                          switch (snapShot.connectionState) {
                            case ConnectionState.none:
                              return error('nothing happened');

                            case ConnectionState.waiting:
                              return loading();

                            case ConnectionState.active:
                              return loading();

                            case ConnectionState.done:
                              if (snapShot.hasError) {
                                return error(snapShot.error.toString());
                              } else {
                                if (!snapShot.hasData) {
                                  return error('No data is recorded on DB');
                                } else {
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
                                            child: productComponent(
                                                snapShot.data![position]));
                                      });
                                }
                              }
                          }
                        }),
                  )),
              // SizedBox(
              //   height: height / 3,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
