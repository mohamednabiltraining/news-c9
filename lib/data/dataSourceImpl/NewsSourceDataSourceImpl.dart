import 'package:injectable/injectable.dart';
import 'package:news_app_c9_sun/data/api/ApiManager.dart';
import 'package:news_app_c9_sun/data/dataSourceContract/NewsSourceDataSource.dart';
import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';

@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImpl extends NewsSourceDataSource{

  ApiManager apiManager;

  @factoryMethod
  NewsSourceDataSourceImpl(this.apiManager); // constructor injection

  @override
  Future<List<Source>?> getSources(String catId)async {
    var response = await apiManager.getSources(catId);
    return response.sources;
  }
}