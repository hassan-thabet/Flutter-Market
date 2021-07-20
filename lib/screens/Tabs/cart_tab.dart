import 'package:flutter/material.dart';
import 'package:flutter_store/api/carts_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/cart.dart';
import 'package:flutter_store/utilities/api_helper.dart';
import 'package:flutter_store/widgets/components/custom_dialog.dart';
import 'package:flutter_store/widgets/components/loading_screen.dart';
import 'package:flutter_store/widgets/components/my_snack_bar.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';
import 'package:intl/intl.dart';

class CartTab extends StatefulWidget {


  @override
  _CartTabState createState() => _CartTabState();
}
class _CartTabState extends State<CartTab> {
  CartsApi cartsApi = CartsApi();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final format = new NumberFormat("#,##0", "en_US");

    return (isLoading) ? LoadingScreen() :  Scaffold(
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
                    // case ConnectionState.waiting:
                      return loading();

                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            Center(child: Image.asset('assets/images/empty_cart.png'),),
                            Text(
                              'Products you may like will appear here ',
                              style: TextStyle(
                                color: AppColors.M_dark_text_color,
                                fontFamily: 'Quicksand',
                              ),
                            )
                          ],
                        );
                      } else {
                        if (snapshot.hasData) {
                          return ListView(
                            children: [
                              (snapshot.data!.cartItems!.length == 0)
                                  ? Column(
                                    children: [
                                      Center(child: Image.asset('assets/images/empty_cart.png'),),
                                      Text(
                                        'Products you may like will appear here ',
                                        style: TextStyle(
                                          color: AppColors.M_dark_text_color,
                                          fontFamily: 'Quicksand',
                                        ),
                                      )
                                    ],
                                  )
                                  : ListView.builder(
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
            child:  FutureBuilder(
                future: cartsApi.fetchCart(),
                builder: (BuildContext context, AsyncSnapshot<Cart> snapshot) {
                  {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      // case ConnectionState.waiting:
                        return loading();

                      case ConnectionState.done:
                        if (snapshot.hasError) {

                          return error('');
                        } else {
                          if (snapshot.hasData) {
                            print(snapshot.data!.total.toString());
                            return (snapshot.data!.cartItems!.length == 0)
                                ? Container()
                                : Column(
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
                                      (snapshot.data!.total! < 500)
                                          ? Text('')
                                          : Text(
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


  Widget cartItemComponent(CartItem cartItem)
  {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    right: 8, left: 8, top: 8, bottom: 8),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                        image: NetworkImage((ApiHelper.MAIN_IMAGES_URL +
                            cartItem.product!.images![0])))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          cartItem.product!.title.toString(),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          cartItem.product!.type.toString(),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              cartItem.product!.price.toString() + ' LE',
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // flex: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () async
                        {
                          setState((){
                            isLoading = true;
                          });
                          await cartsApi.addProductToCart(cartItem.product!.id!);
                          setState((){
                            isLoading = false;
                          });
                          showInSnackBar(context, 'Product quantity has been increased successfully to ${(cartItem.quantity! + 1.0).toStringAsFixed(0)}');
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.M_app_main_color,
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.only(
                            bottom: 2, right: 10, left: 12),
                        child: Text(
                          cartItem.quantity!.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.M_dark_text_color,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () async
                        {
                            if(cartItem.quantity! > 1)
                            {
                              setState((){
                                isLoading = true;
                              });
                              await cartsApi.removeProductFromCart(cartItem.product!.id!);
                              showInSnackBar(context, 'Product quantity has been decreased successfully to ${(cartItem.quantity! - 1.0).toStringAsFixed(0)}');
                              setState((){
                                isLoading = false;
                              });
                            }else
                              {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => CustomDialog(
                                    title: "Do you want to delete this product ?",
                                    description: "This is the last piece of this product in your cart Do you want to delete it",
                                    buttonText: "Yes , Delete",
                                    icon: Icon(
                                      Icons.delete_forever,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    buttonFunc: () async {
                                      setState((){
                                        isLoading = false;
                                      });
                                      await cartsApi.deleteProductFromCart(cartItem.product!.id!);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                );
                              }
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.M_app_main_color,
                          child: Icon(
                            Icons.remove,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );}


}



