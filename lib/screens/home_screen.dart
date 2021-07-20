import 'package:flutter/material.dart';
import 'package:flutter_store/constants/app_color.dart';
import 'package:flutter_store/screens/Tabs/home_tab.dart';
import 'package:flutter_store/screens/Tabs/search_tab.dart';
import 'Tabs/cart_tab.dart';
import 'Tabs/more_tab.dart';
import 'Tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  void _onItemTapped(int index) {
    setState(() {
      currentTab = index;
    });
  }

  final List<Widget> _screens = [
    HomeTab(),
    SearchTab(),
    CartTab(),
    ProfileTab(),
    MoreTab(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.M_background_color,
      body: _screens.elementAt(currentTab),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab,
        selectedItemColor: AppColors.M_app_main_color,
        unselectedItemColor: AppColors.M_icons_color,
        onTap: (value) {
          _onItemTapped(currentTab);
          setState(() => currentTab = value);
        },
        selectedLabelStyle: TextStyle(
          fontFamily: 'Quicksand',
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Quicksand',
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.menu_outlined),
          ),
        ],
      ),
    );
  }
}
