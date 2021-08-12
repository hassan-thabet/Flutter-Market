import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_store/api/carts_api.dart';
import 'package:flutter_store/api/reviews_api.dart';
import 'package:flutter_store/bloc/product/product_bloc.dart';
import 'package:flutter_store/bloc/product/product_states.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/models/review.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_store/widgets/UI/custom_dialog.dart';
import 'package:flutter_store/widgets/UI/my_snack_bar.dart';
import 'package:flutter_store/widgets/api/Done/review_component.dart';
import 'package:flutter_store/widgets/api/Error/error.dart';
import 'package:flutter_store/widgets/api/Loading/review_component_shimmer.dart';
import 'package:flutter_store/widgets/api/NoData/no_data.dart';
import 'package:flutter_store/widgets/ui/add_review_sheet.dart';
import 'package:flutter_store/widgets/ui/rate_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';


class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ProductBloc.get(context).dispose();

    ReviewsApi reviewsApi = ReviewsApi();
    CartsApi cartsApi = CartsApi();
    addProductToCart() async {
      final preferences = await SharedPreferences.getInstance();
      final key = 'user_id';
      final value = preferences.get(key) ?? null;
      if (value != null) {
        try {
          await cartsApi.addProductToCart(product.id!);
          showInSnackBar(context, 'Product added to your cart successfully');
        } catch (Ex) {
          print(Ex);
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: "you are not authorized",
            description: "To use the shopping cart you must be logged in",
            buttonText: "Login",
            icon: Icon(
              Icons.person_add_alt_1_outlined,
              color: Colors.white,
              size: 40,
            ),
            buttonFunc: () {
              Navigator.of(context)
                  .pushNamed(LoginScreen.id); // To close the dialog
            },
          ),
        );
      }
    }


    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ProductBloc , ProductStates>(
      listener: (context, state){  },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.M_app_main_color,
            onPressed: () {
              addProductToCart();
            },
            child: Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: AppColors.M_icons_color, //change your color here
            ),
            centerTitle: false,
            title: Text(
              product.title!,
              style: TextStyle(
                color: AppColors.M_dark_text_color,
                fontFamily: 'Quicksand',
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Container(
                    height: height / 3,
                    child: CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 2),
                            ),
                        items: <Widget>[
                          for (var index = 0;
                          index < product.images!.length;
                          index++)
                            Image.network(
                              ApiHelper.MAIN_IMAGES_URL +
                                  product.images![index],
                              height: height / 3,
                            ),
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: product.images!.asMap().entries.map((entry) {
                      return Container(
                        width:  8,
                        height:  8,
                        margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (AppColors.M_app_main_color).withOpacity(0.9)),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.title!,
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.M_dark_text_color,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      (product.rateAvg != null)
                      ? RateBar(double.parse(product.rateAvg!.toString()))
                      : Text('Discount 10%' , style: TextStyle(color: Colors.red),),

                      SizedBox(
                        width: 10,
                      ),
                      (product.rateAvg != null)
                       ? Text(
                          product.rateAvg.toString(),
                          style: TextStyle(
                            color: AppColors.M_dark_text_color,
                            fontFamily: 'Quicksand',
                          ),
                        )
                      :Text(
                        'No Reviews Yet !',
                        style: TextStyle(
                          color: AppColors.M_dark_text_color,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' - ' + product.reviewsCount.toString() + ' Reviews',
                        style: TextStyle(
                          color: AppColors.M_dark_text_color,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.type!,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.M_dark_text_color,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      Spacer(),
                      Text(
                        product.price.toString(),
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.M_app_main_color,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      Text(
                        ' LE',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.M_dark_text_color,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),

                  DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: TabBar(
                              onTap: (index) {
                                ProductBloc.get(context).selectTab(index);
                              },
                              tabs: [
                                Tab(
                                  text: 'Description',
                                ),
                                Tab(
                                  text: 'Details',
                                ),
                                Tab(
                                  text: 'Reviews',
                                ),
                              ],
                              unselectedLabelColor: Colors.black87,
                              labelColor: AppColors.M_app_main_color,
                              indicatorColor: AppColors.M_app_main_color,
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelStyle: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Builder(builder: (_) {
                            if (ProductBloc.get(context).selectedTabBar == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 70),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Product description',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.M_dark_text_color,
                                          fontFamily: 'Quicksand',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        product.description!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.M_dark_text_color,
                                          fontFamily: 'Quicksand',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            }
                            else if (ProductBloc.get(context).selectedTabBar == 1) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 70),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Product details',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.M_dark_text_color,
                                          fontFamily: 'Quicksand',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      product.details.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.M_dark_text_color,
                                        fontFamily: 'Quicksand',
                                      ),
                                    ),
                                  ],
                                )
                              ); //2nd tabView
                            }
                            else {
                              return Padding(
                                  padding: const EdgeInsets.only(bottom: 70),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        FutureBuilder(
                                            future: reviewsApi.fetchReviews(
                                                product.id.toString()),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<Review>> snapShot) {
                                              switch (snapShot.connectionState) {
                                                case ConnectionState.none:
                                                case ConnectionState.waiting:
                                                case ConnectionState.active:

                                                return Shimmer.fromColors(
                                                    baseColor: Colors.grey,
                                                    highlightColor: Colors.grey.withAlpha(100),
                                                    child: ListView.builder(
                                                      itemCount: 2,
                                                      shrinkWrap: true,
                                                      primary: false,
                                                      itemBuilder: (_, __) => Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ReviewComponentShimmer(),
                                                      ),
                                                    )
                                                );

                                                case ConnectionState.done:
                                                  if (snapShot.hasError) {
                                                    return error();
                                                  } else {
                                                    if (snapShot.data!.length < 1) {
                                                      return Column(
                                                        children: [
                                                          TextButton(
                                                            onPressed: ()
                                                            {
                                                              addReviewBottomSheet(context , product.id);
                                                            },
                                                            child: Text(
                                                              'add first review',
                                                              style: TextStyle(
                                                                color: AppColors.M_app_main_color,
                                                                decoration: TextDecoration.none,
                                                                fontFamily: 'Quicksand',
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 30,),
                                                          noData('No Reviews yet !'),
                                                        ],
                                                      );
                                                    } else {
                                                      return Column(
                                                        children: [
                                                          TextButton(
                                                            onPressed: ()
                                                            {
                                                              addReviewBottomSheet(context , product.id );
                                                            },
                                                            child: Text(
                                                              'add review',
                                                              style: TextStyle(
                                                                color: AppColors.M_app_main_color,
                                                                decoration: TextDecoration.none,
                                                                fontFamily: 'Quicksand',
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 30,),
                                                          ListView.builder(
                                                              physics:
                                                              NeverScrollableScrollPhysics(),
                                                              itemCount:
                                                              snapShot.data!.length,
                                                              shrinkWrap: true,
                                                              itemBuilder:
                                                                  (context, position) {
                                                                return reviewComponent(snapShot.data![position]);
                                                              }),
                                                        ],
                                                      );
                                                    }
                                                  }
                                              }
                                            }),
                                      ],
                                    ),
                                  ));
                            }
                          }),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

