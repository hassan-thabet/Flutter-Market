
import 'package:flutter/material.dart';
import 'package:flutter_store/api/categories_api.dart';
import 'package:flutter_store/api/subcategories_api.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/models/category.dart';
import 'package:flutter_store/models/subcategory.dart';
import 'package:flutter_store/widgets/connection/error.dart';
import 'package:flutter_store/widgets/connection/loading.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}
  CategoriesApi categoriesApi = CategoriesApi();
  SubcategoriesApi subcategoriesApi = SubcategoriesApi();


class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.M_icons_color, //change your color here
        ),
        centerTitle: true,
        title: Text(
          widget.category.categoryName ,
          style: TextStyle(
            color: AppColors.M_dark_text_color ,
            fontFamily: 'Quicksand',
            letterSpacing: 1.7,
          ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 18 , right: 18 , left: 18),
                child: Container(
                  height: height * 0.8,
                  width: width,
                  child: FutureBuilder(
                      future: subcategoriesApi.fetchSubcategories(widget.category.id.toString()),
                      builder: (BuildContext context , AsyncSnapshot<List<Subcategory>> snapShot){
                        switch(snapShot.connectionState) {
                          case ConnectionState.none:
                            return error('nothing happened');
                            break;
                          case ConnectionState.waiting:
                            return loading();
                            break;
                          case ConnectionState.active:
                            return loading();
                            break;
                          case ConnectionState.done:
                            if(snapShot.hasError){
                              return error(snapShot.error.toString());
                            }else{
                              if(! snapShot.hasData){
                                return error('No data is recorded on DB');
                              }else{
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapShot.data.length,
                                    itemBuilder: (context, position) {
                                      return GestureDetector(
                                          // onTap: () {
                                          //   _goToCategoryScreen(
                                          //       snapShot.data[position],
                                          //       context);
                                          // },
                                          child: subcategoryComponent(snapShot.data[position])
                                      );
                                    }
                                );
                              }
                            }
                        }
                        return Container();
                      }
                  ),
                )
            ),
          ],
        ),
      ),

    );

  }
}

Widget subcategoryComponent(Subcategory subcategory) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ListTile(
        tileColor: Colors.white,
      leading: Icon(Icons.auto_awesome_mosaic_outlined),
      title: Text(
            subcategory.subcategoryName,
          style: TextStyle(
            color: AppColors.M_dark_text_color ,
            fontFamily: 'Quicksand',

          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios , color: AppColors.M_app_main_color,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

    ),
  );
}