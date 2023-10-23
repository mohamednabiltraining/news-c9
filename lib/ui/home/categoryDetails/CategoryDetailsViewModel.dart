import 'package:flutter/material.dart';
import 'package:news_app_c9_sun/api/ApiManager.dart';
import 'package:news_app_c9_sun/model/sourcesResponse/Source.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? newsSourcesList ;
  String? errorMessage ;
  bool? showLoading ;

  void getSources(String categoryId)async{
    // call api
    showLoading = true;
    newsSourcesList = null;
    errorMessage = null;
    notifyListeners();

    try{
      var response = await ApiManager.getSources(categoryId);
      showLoading = null;
      if(response.status=='error'){
        // has error
        errorMessage = response.message;
      }else {
        // has data
        newsSourcesList = response.sources;
      }
    }catch(e){
      showLoading = null;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}