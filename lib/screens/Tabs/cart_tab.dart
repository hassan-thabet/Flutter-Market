import 'package:flutter/material.dart';
import 'package:flutter_store/api/carts_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/cart.dart';
import 'package:flutter_store/widgets/api/cart_item_component.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';
import 'package:intl/intl.dart';

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() => _CartTabState();
}

CartsApi cartsApi = CartsApi();

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final format = new NumberFormat("#,##0", "en_US");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'cart'.toUpperCase(),
          style: TextStyle(
            color: AppColors.M_dark_text_color,
            fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: cartsApi.fetchCart(),
                builder: (BuildContext context, AsyncSnapshot<Cart> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return loading();

                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return error(snapshot.error.toString());
                      } else {
                        if (snapshot.hasData) {
                          return ListView(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: snapshot.data!.cartItems!.length,
                                  itemBuilder:
                                      (BuildContext context, int position) {
                                    return cartItemComponent(
                                        snapshot.data!.cartItems![position]);
                                  }),
                            ],
                          );
                        } else {
                          return error('NO DATA');
                        }
                      }

                    default:
                      return Container();
                  }
                }),
            flex: 83,
          ),
          Spacer(),
          Expanded(
            child: FutureBuilder(
                future: cartsApi.fetchCart(),
                builder: (BuildContext context, AsyncSnapshot<Cart> snapshot) {
                  {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return loading();

                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return error(snapshot.error.toString());
                        } else {
                          if (snapshot.hasData) {
                            print(snapshot.data!.total.toString());
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 22.0 , left: 22 , top: 8),
                                  child: Row(
                                    children: [
                                    Text(
                                      'Total : ',
                                      style: TextStyle(
                                        color: AppColors.M_dark_text_color,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Quicksand',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                    Text(
                                      format.format(snapshot.data!.total) + ' LE',
                                      style: TextStyle(
                                        color: AppColors.M_app_main_color,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Quicksand',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                          'FREE SHIPPING !',
                                          style: TextStyle(
                                            color: AppColors.M_dark_text_color,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Quicksand',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 22 , left: 22 , top: 8 , bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      TextButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  vertical: height / 55)),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.M_app_main_color),

                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                        onPressed: (){},
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Check Out ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Quicksand',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(' ',),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return error('NO DATA');
                          }
                        }

                      default:
                        return Container();
                    }
                  }
                }),
            flex: 17,
          ),
        ],
      ),
    );
  }
}
