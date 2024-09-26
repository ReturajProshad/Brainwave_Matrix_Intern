import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/model/articleModel.dart';
import 'package:news_app_with_rest_api/model/bookmarkModel.dart';
import 'package:news_app_with_rest_api/services/News_api_service.dart';

class NewsProvider with ChangeNotifier {
  static NewsProvider instance = NewsProvider();
  List<Article> _articles = [];
  bool _loading = true;
  List<Bookmarkmodel> addToBookMarkList = [];
  //change this heading during transformation
  String currentHeading = Constants.instants.fromTopHome;

  void updateHeading(String _newHead) {
    currentHeading = _newHead;
    notifyListeners();
  }

  List<Article> get articles => _articles;
  bool get loading => _loading;

  NewsProvider() {
    loadArticles();
  }

  void loadArticles() {
    if (currentHeading == Constants.instants.fromTopHome) {
      fetchNews();
    } else if (currentHeading != Constants.instants.fromCateGory) {
      fetchCategory(currentHeading);
    }
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

  Future<void> fetchCategory(String _title) async {
    try {
      _loading = true;
      notifyListeners();
      _articles = await NewsService().fetchByCategory(_title);
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void addToBookMark(String Title, String url, String imageToUrl) {
    addToBookMarkList.add(Bookmarkmodel(Title, url, imageToUrl));
    // print(_addToBookMark[0].title);
    notifyListeners();
  }
}
