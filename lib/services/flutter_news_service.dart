import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/models/article_model.dart';
import 'package:flutter_news_api/models/category.dart';
import 'package:flutter_news_api/models/sortBy.dart';
import 'package:flutter_news_api/models/sources.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class FlutterNewsService {
  String _baseURLTopHeadliness = "http://newsapi.org/v2/top-headlines";
  String _baseURLEverything = "http://newsapi.org/v2/everything";
  String _baseURLSources = "https://newsapi.org/v2/sources";

  String _returnCategory(Category category) {
    switch (category) {
      case Category.business:
        return "business";
        break;
      case Category.entertainment:
        return "entertainment";
        break;
      case Category.general:
        return "general";
        break;
      case Category.health:
        return "health";
        break;
      case Category.science:
        return "science";
        break;
      case Category.technology:
        return "technology";
        break;
      default:
    }
    String _returnSortBy(SortBy sortBy) {
      switch (sortBy) {
        case SortBy.popularity:
          return "popularity";
          break;
        case SortBy.publishedAt:
          return "publishedAt";
          break;
        case SortBy.relevancy:
          return "relevancy";
          break;
        default:
      }

      Future<List<Article>> getArticlesByQuery(
          {@required String apiKey,
          @required String query,
          DateTime from,
          DateTime to,
          int page,
          String languageCode,
          SortBy sortBy}) async {
        String sortByString = _returnSortBy(sortBy);
        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        String url = _baseURLEverything +
            "?q=$query&from=${dateFormat.format(from)}&to=${dateFormat.format(to)}&sortBy=$sortByString&page=$page";
        http.Response res = await http.get(url);
        Map<String, dynamic> data = jsonDecode(res.body);
        List<Article> articleList = List.generate(data['articles'].length,
            (index) => Article.fromJSON(data['articles'][index]));

        return articleList;
      }

      Future<List<Article>> getArticlesByQuerySources(
          {@required String apiKey,
          @required String query,
          DateTime from,
          DateTime to,
          String sources,
          int page,
          String languageCode,
          SortBy sortBy}) async {
        String sortByString = _returnSortBy(sortBy);
        DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        String url = _baseURLEverything +
            "?q=$query&from=${dateFormat.format(from)}&to=${dateFormat.format(to)}&sortBy=$sortByString&page=$page&sources=$sources";
        http.Response res = await http.get(url);
        Map<String, dynamic> data = jsonDecode(res.body);
        List<Article> articleList = List.generate(data['articles'].length,
            (index) => Article.fromJSON(data['articles'][index]));

        return articleList;
      }

      Future<List<Article>> getArticlesTopHeadlines(
          {@required String apiKey,
          String query,
          Category category,
          String countryCode,
          int page,
          SortBy sortBy}) async {
        String categoryString = _returnCategory(category);

        String url = _baseURLTopHeadliness +
            "?q=$query&category=$categoryString&country=$countryCode&page=$page";
        http.Response res = await http.get(url);
        Map<String, dynamic> data = jsonDecode(res.body);
        List<Article> articleList = List.generate(data['articles'].length,
            (index) => Article.fromJSON(data['articles'][index]));

        return articleList;
      }

      Future<List<Article>> getArticlesTopHeadlinesBySources(
          {@required String apiKey,
          String query,
          Category category,
          String countryCode,
          String sources,
          int page,
          SortBy sortBy}) async {
        String categoryString = _returnCategory(category);

        String url = _baseURLTopHeadliness +
            "?q=$query&category=$categoryString&country=$countryCode&page=$page&sources=$sources";
        http.Response res = await http.get(url);
        Map<String, dynamic> data = jsonDecode(res.body);
        List<Article> articleList = List.generate(data['articles'].length,
            (index) => Article.fromJSON(data['articles'][index]));

        return articleList;
      }

      Future<List<Sources>> getAllSources({
        @required String apiKey,
        Category category,
        String countryCode,
        String language,
      }) async {
        String categoryString = _returnCategory(category);
        String url = _baseURLSources +
            "?$apiKey&country=$countryCode&language=$language&category=$categoryString";
        http.Response res = await http.get(url);
        Map<String, dynamic> data = jsonDecode(res.body);
        List<Sources> sourceList = List.generate(data['sources'].length,
            (index) => Sources.fromMap(data['sources'][index]));

        return sourceList;
      }
    }
  }
}
