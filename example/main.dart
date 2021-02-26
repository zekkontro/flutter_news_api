import 'package:flutter_news_api/models/article_model.dart';
import 'package:flutter_news_api/flutter_news_api.dart';

void main() async {
  FlutterNewsService newsService = FlutterNewsService();

  // Get Top Articles
  List<Article> articles = await newsService.getArticlesTopHeadlines(
    apiKey: "<API-KEY>",
    category: Category.business,
    countryCode: "us",
    query: "flutter",
    sortBy: SortBy.popularity,
  );

  // Get everything article by query
  List<Article> articleList = await newsService.getArticlesByQuery(
      apiKey: "<API-KEY>",
      query: "",
      from: DateTime.now(),
      to: DateTime.now(),
      sortBy: SortBy.popularity,
      languageCode: "en");
  // Get top articles by source id
  List<Article> articleList2 =
      await newsService.getArticlesTopHeadlinesBySources(
    apiKey: "<API-KEY>",
    category: Category.general,
    countryCode: "us",
    sources: "bbc-news",
  );
  // Get all new source
  List<Sources> sources = await newsService.getAllSources(
      apiKey: "<API-KEY>",
      category: Category.general,
      language: "en",
      countryCode: "us");
}
