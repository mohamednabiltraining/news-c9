import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';

abstract class NewsSourceDataSource{
  Future<List<Source>?> getSources(String catId);
}