

import 'package:news_app_c9_sun/data/model/sourcesResponse/Source.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Gideon Lichfield, Lauren Goode"
/// title : "Where Does Crypto Go From Here?"
/// description : "We talk with Michael Casey, the chief content officer of CoinDesk, almost one year after the news site brought down Sam Bankman-Fried’s cryptocurrency empire FTX."
/// url : "https://www.wired.com/story/have-a-nice-future-podcast-24/"
/// urlToImage : "https://media.wired.com/photos/6525c8ac419624284be05210/191:100/w_1280,c_limit/HANF-Michael%20Casey.jpg"
/// publishedAt : "2023-10-11T11:00:00Z"
/// content : "Gideon Lichfield: You said just now that what Sam Bankman-Fried did was allegedly illegal. Is there a world in which it wasn't illegal?\r\nMichael Casey: I think we allI know. I'm trying to be a good j… [+2082 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
News copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => News(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}