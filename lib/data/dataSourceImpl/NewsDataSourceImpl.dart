import 'package:injectable/injectable.dart';
import 'package:news_app_c9_sun/data/api/ApiManager.dart';
import 'package:news_app_c9_sun/data/dataSourceContract/NewsDataSource.dart';
import 'package:news_app_c9_sun/data/model/newsResponse/news.dart';

@Injectable(as:NewsDataSource)
class NewsOnlineDataSourceImpl extends NewsDataSource{
  ApiManager apiManager;

  @factoryMethod
  NewsOnlineDataSourceImpl(this.apiManager);

  @override
  Future<List<News>?> getNews(String? sourceId)async{
    var response = await apiManager.getNews(sourceId);
    return response.articles;
  }
}