import 'package:flutter/material.dart';
import 'package:news_app_c9_sun/ui/home/categories/Category.dart';
import 'package:news_app_c9_sun/ui/home/categories/CategoryWidget.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoriesFragment extends StatelessWidget {
  OnCategoryClick onCategoryClick;
  CategoriesFragment(this.onCategoryClick,{super.key});
  List<Category> categories = Category.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''Pick your category \nof interest''',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24 ,
                  crossAxisSpacing: 20
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      onCategoryClick(categories[index]);
                    },
                    child: CategoryItem(categories[index],index)),
            itemCount: categories.length,),
          )
        ],
      ),
    );
  }
}
