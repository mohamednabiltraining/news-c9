import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';
import 'package:news_app_c9_sun/di/di.dart';
import 'package:news_app_c9_sun/ui/home/news/NewsViewModel.dart';
import 'package:news_app_c9_sun/ui/home/news/NewsWidget.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = getIt.get<NewsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.source.id);
  }
  @override
  Widget build(BuildContext context) {
    // call api
    return BlocBuilder<NewsViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var newsList = state.newsList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsWidget(newsList![index]);
                },
                itemCount: newsList?.length ?? 0,
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.message),
                    ElevatedButton(onPressed: () {
                      viewModel.loadNews(widget.source.id);
                    }, child: Text('Try Again'))
                  ],
                ),
              );
            }
          case LoadingState():
            {
              return Center(child: CircularProgressIndicator());
            }
        }
      },
    );
    // return FutureBuilder(
    //   future: ApiManager.getNews(source.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.message ?? snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data?.articles;
    //
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsWidget(newsList![index]);
    //       },
    //       itemCount: newsList?.length ?? 0,
    //     );
    //   },
    // );
  }
}
