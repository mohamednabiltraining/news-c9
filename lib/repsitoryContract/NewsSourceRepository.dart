
import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';

abstract class NewsSourceRepository{
  Future<List<Source>?> getSources(String catId);
}

// when to call abstract class is interface ->
// abstract classes doesn't have any concreate