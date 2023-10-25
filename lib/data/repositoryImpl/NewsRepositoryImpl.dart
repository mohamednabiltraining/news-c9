import 'package:injectable/injectable.dart';
import 'package:news_app_c9_sun/data/dataSourceContract/NewsDataSource.dart';
import 'package:news_app_c9_sun/data/model/newsResponse/news.dart';
import 'package:news_app_c9_sun/repsitoryContract/NewsRepositoryContract.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource onlineDataSource;

  @factoryMethod
  NewsRepositoryImpl(this.onlineDataSource);

  @override
  Future<List<News>?> getNews(String? sourceId) {
    return onlineDataSource.getNews(sourceId);
  }
}