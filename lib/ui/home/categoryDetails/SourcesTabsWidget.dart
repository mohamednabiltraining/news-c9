import 'package:flutter/material.dart';
import 'package:news_app_c9_sun/model/sourcesResponse/Source.dart';
import 'package:news_app_c9_sun/ui/home/categoryDetails/TabWidget.dart';
import 'package:news_app_c9_sun/ui/home/news/NewsListWidget.dart';

class SourcesTabsWidget extends StatefulWidget {
  List<Source> sources;
  SourcesTabsWidget(this.sources,{super.key});

  @override
  State<SourcesTabsWidget> createState() => _SourcesTabsWidgetState();
}

class _SourcesTabsWidgetState extends State<SourcesTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          SizedBox(height: 12,),
          TabBar(
            indicatorColor: Colors.transparent,
            onTap: (newIndex){
              selectedIndex = newIndex;
              setState((){});
            },
              isScrollable: true,
              tabs: widget.sources.map((source) => TabWidget(source,
                widget.sources.indexOf(source) == selectedIndex
              )).toList()),
          Expanded(child: NewsListWidget(widget.sources[selectedIndex]))
        ],
      ),
    );
  }
}
