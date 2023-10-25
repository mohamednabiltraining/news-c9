import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c9_sun/data/model/newsResponse/news.dart';
import 'package:news_app_c9_sun/repsitoryContract/NewsRepositoryContract.dart';

@injectable
class NewsViewModel extends Cubit<NewsListState>{
  NewsRepository newsRepository;


  @factoryMethod
  NewsViewModel(this.newsRepository):super(LoadingState('Loading...'));

  void loadNews(String? sourceId)async{
    emit(LoadingState('Loading...'));
    try{
      var newsList  = await newsRepository.getNews(sourceId);
      emit(SuccessState(newsList));
      // if(response.status=='error'){
      //   emit(ErrorState(response.message??""));
      // }else{
      //   emit(SuccessState(response.articles));
      // }
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}
sealed class NewsListState{}
class SuccessState extends NewsListState{
  List<News>? newsList;
  SuccessState(this.newsList);
}
class ErrorState extends NewsListState{
  String message;
  ErrorState(this.message);
}
class LoadingState extends NewsListState{
  String message;
  LoadingState(this.message);
}
