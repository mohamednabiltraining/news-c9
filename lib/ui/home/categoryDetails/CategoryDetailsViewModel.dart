import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c9_sun/api/ApiManager.dart';
import 'package:news_app_c9_sun/model/sourcesResponse/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState>{
  CategoryDetailsViewModel():super(LoadingState('Loading...'));

  void loadSources(String categoryId)async{
    emit(LoadingState('Loading...'));
    try{
      var response = await ApiManager.getSources(categoryId);
      if(response.status=='error'){
        emit(ErrorState(response.message??""));
      }else {
        emit(SuccessState(response.sources));
      }
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class CategoryDetailsState{}

class SuccessState extends CategoryDetailsState{
  List<Source>? sourcesList;
  SuccessState(this.sourcesList);
}
class LoadingState extends CategoryDetailsState{
  String message;
  LoadingState(this.message);
}
class ErrorState extends CategoryDetailsState{
  String errorMessage;
  ErrorState(this.errorMessage);
}