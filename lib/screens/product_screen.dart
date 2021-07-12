import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/screens/login_screen.dart';
import 'package:flutter_store/utilities/api_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_store/widgets/components/custom_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({Key? key,required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentImage = 0;
  int _selectedTabBar = 0;
  final CarouselController _controller = CarouselController();

  read() async
  {
    final preferences = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = preferences.get(key) ?? null;
    if (value != null)
    {
      print('I\'am a user and my id is $value');
    }else
    {
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
          buttonFunc: (){
            Navigator.of(context).pushNamed(LoginScreen.id); // To close the dialog
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.M_app_main_color,
        onPressed: ()
        {
          read();
        },
        child: Icon(Icons.add_shopping_cart_rounded , color: Colors.white,),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.M_icons_color, //change your color here
        ),
        centerTitle: false,
        title: Text(
          widget.product.title!,
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
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImage = index;
                          });
                        }),
                    items: <Widget>[
                      for (var index = 0;
                          index < widget.product.images!.length;
                          index++)
                        Image.network(
                          ApiHelper.MAIN_IMAGES_URL +
                              widget.product.images![index],
                          height: height / 3,
                        ),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.product.images!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _currentImage == entry.key ? 10 : 8,
                      height: _currentImage == entry.key ? 10 : 8,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (AppColors.M_app_main_color).withOpacity(0.9)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.product.title!,
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.M_dark_text_color,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  Icon(
                    Icons.star_half,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  Icon(Icons.star_border, color: Colors.amberAccent, size: 20),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    ' 4.6  -  135 Reviews',
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
                    widget.product.type!,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.M_dark_text_color,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.product.price.toString(),
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
                            setState(() {
                              _selectedTabBar = index;
                            });
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
                        if (_selectedTabBar == 0) {
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
                                    widget.product.description!,
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
                        } else if (_selectedTabBar == 1) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                            child: Center(
                              child: Text(
                                'Product details',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.M_dark_text_color,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ),
                          ); //2nd tabView
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                            child: Center(
                              child: Text(
                                'Product reviews',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.M_dark_text_color,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
