import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/api/categories_api.dart';
import 'package:flutter_store/api/products_api.dart';
import 'package:flutter_store/bloc/search/search_bloc.dart';
import 'package:flutter_store/bloc/search/search_states.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/category.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/widgets/Api/NoData/no_data.dart';
import 'package:flutter_store/widgets/api/Done/category_component.dart';
import 'package:flutter_store/widgets/api/Done/product_component.dart';
import 'package:flutter_store/widgets/api/Done/search_item_component.dart';
import 'package:flutter_store/widgets/api/Loading/category_component_shimmer.dart';
import 'package:flutter_store/widgets/api/Loading/product_component_shimmer.dart';
import 'package:flutter_store/widgets/api/Error/error.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../category_screen.dart';
import '../product_screen.dart';

class HomeTab extends StatelessWidget {
  final CategoriesApi categoriesApi = new CategoriesApi();
  final ProductsApi productsApi = new ProductsApi();

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    var searchController = FloatingSearchBarController();

    return BlocConsumer<SearchBloc, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = SearchBloc.get(context).searchList;
          return Padding(
            padding: EdgeInsets.only(top: statusBarHeight ),
            child: FloatingSearchBar(
              leadingActions : [
                FloatingSearchBarAction(
                  showIfOpened: false,
                  child: CircularButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ] ,
              hint: 'Search for products',
              hintStyle: TextStyle(
                color: AppColors.M_dark_text_color,
                fontFamily: 'Quicksand',
              ),
              queryStyle: TextStyle(
                color: AppColors.M_dark_text_color,
                fontFamily: 'Quicksand',
              ),

              scrollPadding: const EdgeInsets.only(top: 20, bottom: 56),
              transitionDuration: const Duration(milliseconds: 400),
              transitionCurve: Curves.easeInOut,
              physics: const BouncingScrollPhysics(),
              openAxisAlignment: 0.0,
              width: width - 26,
              debounceDelay: const Duration(milliseconds: 400),
              onQueryChanged: (value) {
                if (value.isNotEmpty) {
                  SearchBloc.get(context).getSearch(value);
                  print(value);
                } else {
                  SearchBloc.get(context).emptyList();
                }
              },
              controller: searchController,
              transition: CircularFloatingSearchBarTransition(),
              clearQueryOnClose: true,
              actions: [
                FloatingSearchBarAction(
                  showIfOpened: false,
                  child: CircularButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),

                FloatingSearchBarAction.searchToClear(
                  showIfClosed: false,
                ),
              ],
              builder: (context, transition) {
                return (list.isEmpty)
                    ? Container()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Material(
                          color: Colors.white,
                          elevation: 4.0,
                          child: ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  searchItemComponent(list[index]),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount:
                                  SearchBloc.get(context).searchList.length),
                        ),
                      );
              },
              body: Scaffold(
                resizeToAvoidBottomInset: false,
                body: ListView(
                  children: [
                    SizedBox(
                      height: height * .09,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: height / 50,
                        ),
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
                                      case ConnectionState.waiting:
                                      case ConnectionState.active:
                                        return Shimmer.fromColors(
                                            baseColor: Colors.grey,
                                            highlightColor: Colors.grey.withAlpha(100),
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 12,
                                              itemBuilder: (_, __) => CategoryComponentShimmer(),
                                            )
                                        );


                                      case ConnectionState.done:
                                        if (snapShot.hasError) {
                                          return error();
                                        } else {
                                          if (!snapShot.hasData) {
                                            return noData(
                                                'No data is recorded on DB');
                                          } else {
                                            return ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: snapShot.data!.length,
                                                itemBuilder: (context, position) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        _goToCategoryScreen(
                                                            snapShot
                                                                .data![position],
                                                            context);
                                                      },
                                                      child: categoryComponent(
                                                          snapShot
                                                              .data![position]));
                                                });
                                          }
                                        }
                                    }
                                  }),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Recently arrived',
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
                                      case ConnectionState.waiting:
                                      case ConnectionState.active:

                                      return Shimmer.fromColors(
                                          baseColor: Colors.grey,
                                          highlightColor: Colors.grey.withAlpha(100),
                                          child:
                                          ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 12,
                                            itemBuilder: (_, __) => Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ProductComponentShimmer(),
                                            ),
                                          )
                                      );


                                      case ConnectionState.done:
                                        if (snapShot.hasError) {
                                          return error();
                                        } else {
                                          if (!snapShot.hasData) {
                                            return noData(
                                                'No data is recorded on DB');
                                          } else {
                                            return ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: snapShot.data!.length,
                                                itemBuilder: (context, position) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        _goToProductScreen(
                                                            snapShot
                                                                .data![position],
                                                            context);
                                                      },
                                                      child: productComponent(
                                                          snapShot
                                                              .data![position]));
                                                });
                                          }
                                        }
                                    }
                                  }),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
