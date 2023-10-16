import 'package:flutter/material.dart';
import 'package:news_app_c9_sun/ui/home/HomeDrawer.dart';
import 'package:news_app_c9_sun/ui/home/categories/CategoriesFragment.dart';
import 'package:news_app_c9_sun/ui/home/categories/Category.dart';
import 'package:news_app_c9_sun/ui/home/categoryDetails/CategoryDetails.dart';
import 'package:news_app_c9_sun/ui/home/settings/SettingsFragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png',),
                fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          drawer: HomeDrawer(onMenuItemClick),
          appBar: AppBar(
            title: Text('News App'),
          ),
          body: selectedWidget,
        ));
  }
  late Widget selectedWidget ;

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.categories : {
        selectedWidget = CategoriesFragment(onCategoryItemClick);
      }
      case MenuItem.settings : {
        selectedWidget = SettingsFragment();
      }
    }
    setState((){});
  }
  void onCategoryItemClick(Category category){
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
