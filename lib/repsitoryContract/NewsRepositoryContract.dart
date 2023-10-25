import 'package:news_app_c9_sun/data/model/newsResponse/news.dart';

abstract class NewsRepository{

  Future<List<News>?> getNews(String? sourceId);
}