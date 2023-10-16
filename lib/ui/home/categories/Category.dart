import 'dart:ui';

class Category{
  String id;
  String title;
  Color color;
  String imageName;
  Category(this.id,this.title,this.imageName, this.color);

  static List<Category> getAllCategories(){
    return[
      Category('sports', 'Sports', 'sports.png', Color(0xFFC91C22)),
      Category('general', 'General', 'general.png', Color(0xFF003E90)),
      Category('health', 'Health', 'health.png', Color(0xFFED1E79)),
      Category('business', 'Business', 'business.png', Color(0xFFCF7E48)),
      Category('technology', 'Technology', 'technology.png', Color(0xFF4882CF)),
      Category('science', 'Science', 'science.png', Color(0xFFF2D352)),

    ];
  }
}