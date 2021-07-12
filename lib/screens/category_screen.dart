
import 'package:flutter/material.dart';
import 'package:flutter_store/api/brands_api.dart';
import 'package:flutter_store/api/categories_api.dart';
import 'package:flutter_store/api/subcategories_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/brand.dart';
import 'package:flutter_store/models/category.dart';
import 'package:flutter_store/models/subcategory.dart';
import 'package:flutter_store/screens/ProductsScreens/subcategory_products_screen.dart';
import 'package:flutter_store/widgets/api/brand_component.dart';
import 'package:flutter_store/widgets/api/subcategory_component.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';

import 'ProductsScreens/brand_products.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;


  CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}
  CategoriesApi categoriesApi = CategoriesApi();
  SubcategoriesApi subcategoriesApi = SubcategoriesApi();
  BrandsApi brandsApi = BrandsApi();





class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void _goToSubcategoryProductsScreen(Subcategory subcategory, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SubcategoryProductsScreen(subcategory: subcategory);
      }));
    }
    void _goToBrandProductsScreen(Brand brand, BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return BrandProductsScreen(brand: brand);
      }));
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.M_icons_color, //change your color here
        ),
        centerTitle: true,
        title: Text(
          widget.category.categoryName! ,
          style: TextStyle(
            color: AppColors.M_dark_text_color ,
            fontFamily: 'Quicksand',
            letterSpacing: 1.7,
          ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            children: [


              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Official Stores',
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
                    height: height / 10,
                    width: width,
                    child: FutureBuilder(
                        future: brandsApi.fetchBrands(widget.category.id.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Brand>> snapShot) {
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
                                if (snapShot.data!.length < 1) {
                                  return error('Some brands will be included soon');
                                } else {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapShot.data!.length,
                                      itemBuilder: (context, position) {
                                        return GestureDetector(
                                            onTap: () {
                                              _goToBrandProductsScreen( snapShot.data![position] , context );
                                            },
                                            child: brandComponent(
                                                snapShot.data![position]));
                                      });
                                }
                              }
                          }
                        }),
                  )),


              SizedBox(
                height: height / 20,
              ),



              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Shop by subcategories',
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

                    width: width,
                    child:   FutureBuilder(
                        future: subcategoriesApi.fetchSubcategories(widget.category.id.toString()),
                        builder: (BuildContext context , AsyncSnapshot<List<Subcategory>> snapShot){

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
                                if(! snapShot.hasData){
                                  return error('No data is recorded on DB');
                                }else{
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapShot.data!.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, position) {
                                        return GestureDetector(
                                          onTap: () {
                                            _goToSubcategoryProductsScreen(
                                              snapShot.data![position],
                                              context);
                                        },
                                            child: subcategoryComponent(snapShot.data![position])
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

