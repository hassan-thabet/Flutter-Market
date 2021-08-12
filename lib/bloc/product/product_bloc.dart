
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store/bloc/product/product_states.dart';

class ProductBloc extends Cubit<ProductStates>
{
  ProductBloc() : super(ProductInitialState());
  static ProductBloc get(context) => BlocProvider.of(context);

  int selectedTabBar = 0;

  void selectTab(index)
  {
    selectedTabBar = index;
    emit((ProductChangeTabState()));
  }
  void dispose() {
    selectedTabBar = 0;
    emit((ProductInitialState()));
  }

}