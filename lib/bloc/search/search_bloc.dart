import 'package:flutter_store/constants/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/bloc/search/search_states.dart';
import 'package:flutter_store/models/product.dart';

class SearchBloc extends Cubit<SearchStates>
{
  SearchBloc() : super(SearchLoadingState());
  static SearchBloc get(context) => BlocProvider.of(context);

  List<Product> searchList = [];
  void getSearch(String value) async
  {

    emit((SearchLoadingState()));
    http.Response response = await http.get(
      Uri.parse(ApiHelper.SEARCH + '/' + value),
    );

    switch (response.statusCode) {
      case 200:
        searchList = [];
        var body = convert.jsonDecode(response.body);
        for (var item in body['data']) {
          searchList.add(Product.fromJson(item));
        }
        emit((SearchSuccessState()));
        print(response.statusCode);
        break;
    }

  }

  void emptyList()
  {
    emit((SearchEmptyListState()));
    searchList = [];
  }
}