import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';
import 'package:news_app_c9_sun/repsitoryContract/NewsSourceRepository.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState>{

  NewsSourceRepository repository;

  @factoryMethod
  CategoryDetailsViewModel(this.repository):super(LoadingState('Loading...'));


  void loadSources(String categoryId)async{
    emit(LoadingState('Loading...'));
    try{
      var sourcesList = await repository.getSources(categoryId);
      emit(SuccessState(sourcesList));
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