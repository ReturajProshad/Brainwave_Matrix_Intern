import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/model/articleModel.dart';
import 'package:news_app_with_rest_api/services/News_api_service.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _loading = true;

  List<Article> get articles => _articles;
  bool get loading => _loading;

  NewsProvider() {
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      _loading = true;
      notifyListeners();
      _articles = await NewsService().fetchTopHeadlines();
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
