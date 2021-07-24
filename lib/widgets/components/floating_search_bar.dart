import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/bloc/search/search_bloc.dart';
import 'package:flutter_store/bloc/search/search_states.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/product.dart';
import 'package:flutter_store/constants/api_helper.dart';
import 'package:flutter_store/screens/ProductsScreens/brand_products.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/material.dart';

Widget buildFloatingSearchBar(BuildContext context) {

  final isPortrait = MediaQuery
      .of(context)
      .orientation == Orientation.portrait;

  var searchController = FloatingSearchBarController();


  return BlocConsumer<SearchBloc , SearchStates>(
    listener: (context , state){},
    builder: (context , state)
    {
      var list = SearchBloc.get(context).searchList;

      return FloatingSearchBar(
        hint: 'Search for products',
        scrollPadding: const EdgeInsets.only(top: 20, bottom: 56),
        transitionDuration: const Duration(milliseconds: 400),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 400),
        onQueryChanged: (value)
        {
          if(value.isNotEmpty)
          {
            SearchBloc.get(context).getSearch(value);
            print(value);
          }else
            {
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
          return
            (list.isEmpty)
                ? Container()
                : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child:

                      ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                        physics: BouncingScrollPhysics(),
                          itemBuilder: (context , index) => searchItem(list[index]),
                          separatorBuilder: (context , index) => Divider(),
                          itemCount: SearchBloc.get(context).searchList.length
                      ),
                  ),
                );
        },
        body: SafeArea(
            child: Padding( padding: const EdgeInsets.only(top: 65 , bottom: 20),
              child:
              FutureBuilder(
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
                            return
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 2 / 3,
                                        crossAxisSpacing: 6,
                                        mainAxisSpacing: 6),
                                    itemCount: (snapShot.data!.length > 20 ) ? 20 : snapShot.data!.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Card(
                                        elevation: 4 ,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              Expanded(child: Image.network(ApiHelper.MAIN_IMAGES_URL + snapShot.data![index].images![0])),
                                              Divider(),
                                              Expanded(
                                                  child:

                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            child: Text(
                                                             snapShot.data![index].type.toString(),
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontFamily: 'Quicksand',
                                                              ),
                                                            ) ,
                                                            alignment: Alignment.topLeft,),
                                                          Text(snapShot.data![index].title.toString() , maxLines: 2,),
                                                          Spacer(),
                                                          Row(
                                                            children: [
                                                              Text(snapShot.data![index].price.toString() + ' LE'),
                                                              Spacer(),
                                                              Padding(
                                                                padding: const EdgeInsets.all(2.0),
                                                                child: CircleAvatar(
                                                                  radius: 15.0,
                                                                  backgroundColor: AppColors.M_app_main_color,
                                                                  child: Icon(Icons.add_shopping_cart , color: Colors.white,size: 15,),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 2 , bottom: 2 , left: 2),
                                                                child: CircleAvatar(
                                                                  radius: 15.0,
                                                                  backgroundColor: AppColors.M_app_main_color,
                                                                  child: Icon(Icons.favorite_border_sharp , color: Colors.white, size: 15,),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                              ),

                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                          }
                        }
                    }
                  }),
            )),
      );
    },
  );
}

Widget searchItem(Product product)
{
  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16 , bottom: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(
                  right: 8, left: 8, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                      image: NetworkImage((ApiHelper.MAIN_IMAGES_URL +
                          product.images![0])))),
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
                        product.title.toString(),
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        product.type.toString(),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product.price.toString() + ' LE',
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    ],
  );}
