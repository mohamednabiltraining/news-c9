import 'package:flutter/material.dart';
import 'package:news_app_c9_sun/api/ApiManager.dart';
import 'package:news_app_c9_sun/model/newsResponse/news.dart';

class NewsListViewModel extends ChangeNotifier{
  bool? showLoading;
  List<News>? newsList;
  String? errorMessage;

  void getNews(String sourceId)async{
    showLoading = true;
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try{
      var response = await ApiManager.getNews(sourceId);
      showLoading = false;
      if(response.status=='error'){
        errorMessage = response.message;
      }else {
        newsList = response.articles;
      }
    }catch(e){
      showLoading=false;
      errorMessage = e.toString();
    }
    notifyListeners();

  }
}