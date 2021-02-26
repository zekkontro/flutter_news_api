import 'package:flutter_news_api/models/source_model.dart';
import 'package:intl/intl.dart';

class Article {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String articleImage;
  final String publishedAtString;
  final DateTime publishedAtDateTime;
  final String content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.articleImage,
      this.publishedAtString,
      this.publishedAtDateTime,
      this.content});

  factory Article.fromJSON(Map<String, dynamic> data) {
    return Article(
        source: SourceModel.fromMap(data['source']),
        articleImage: data['urlToImage'],
        author: data['author'],
        description: data['description'],
        content: data['content'],
        publishedAtDateTime: DateTime.parse(data['publishedDate']),
        publishedAtString: data['publishedDate'],
        title: data['title'],
        url: data['url']);
  }
}
