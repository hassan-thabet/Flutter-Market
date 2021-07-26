import 'package:flutter/material.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/brand.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/widgets/Api/NoData/no_data.dart';
import 'package:flutter_store/widgets/api/Done/custom_product_card.dart';
import 'package:flutter_store/widgets/api/Loading/custom_product_card_shimmer.dart';
import 'package:flutter_store/widgets/api/Error/error.dart';
import 'package:shimmer/shimmer.dart';

class BrandProductsScreen extends StatelessWidget {
  final Brand brand;
  const BrandProductsScreen({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsApi productsApi = new ProductsApi();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // void _goToProductScreen(Product product, BuildContext context) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return ProductScreen(product: product);
    //   }));
    // }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.M_icons_color, //change your color here
        ),
        centerTitle: true,
        title: Text(
          brand.brandName!,
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',
            letterSpacing: 1.7,
          ),
        ),
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
                    'Shop products by brands',
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
                    height: height - 50,
                    width: width,
                    child: FutureBuilder(
                        future: productsApi
                            .fetchProductsByBrand(brand.id.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Product>> snapShot) {
                          switch (snapShot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                            case ConnectionState.active:

                              return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey.withAlpha(100),
                                  child:
                                  GridView.builder(
                                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 2 / 3,
                                        crossAxisSpacing: 3,
                                        mainAxisSpacing: 3),
                                    itemCount: 6,
                                    itemBuilder: (_, __) => CustomProductCardShimmer(),
                                  )
                              );

                            case ConnectionState.done:
                              if (snapShot.hasError) {
                                return error();
                              } else {
                                if (snapShot.data!.length == 0) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: height / 3,
                                      ),
                                      noData('We will be adding more products in this section soon , wait for us'),
                                    ],
                                  );
                                } else {
                                  return GridView.builder(
                                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 2 / 3,
                                          crossAxisSpacing: 3,
                                          mainAxisSpacing: 3),
                                      itemCount: (snapShot.data!.length > 20 ) ? 20 : snapShot.data!.length,
                                      itemBuilder: (BuildContext context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              // onTab method
                                            },
                                            child: customProductCard(
                                                snapShot.data![index]));
                                      });
                                }
                              }
                          }
                        }),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


