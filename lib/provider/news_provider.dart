import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/model/articleModel.dart';
import 'package:news_app_with_rest_api/services/News_api_service.dart';

class NewsProvider with ChangeNotifier {
  static NewsProvider instance = NewsProvider();
  List<Article> _articles = [];
  bool _loading = true;

  //change this heading during transformation
  String currentHeading = Constants.instants.fromTopHome;

  void updateHeading(String _newHead) {
    currentHeading = _newHead;
    notifyListeners();
  }

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
