import 'package:injectable/injectable.dart';
import 'package:news_app_c9_sun/data/dataSourceContract/NewsSourceDataSource.dart';
import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';
import 'package:news_app_c9_sun/repsitoryContract/NewsSourceRepository.dart';

@Injectable(as: NewsSourceRepository)
class NewsSourceRepositoryImpl extends NewsSourceRepository{
  NewsSourceDataSource onlineDataSource;// depenadency

  @factoryMethod
  NewsSourceRepositoryImpl(this.onlineDataSource);

  @override
  Future<List<Source>?> getSources(String catId) {
    return onlineDataSource.getSources(catId);
  }
}