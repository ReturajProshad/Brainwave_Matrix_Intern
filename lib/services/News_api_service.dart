import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:news_app_with_rest_api/model/articleModel.dart';

class NewsService {
  final String _apiKey = '2f4fd3ba07234f8997f5fb9b5fdc242f';
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlines() async {
    final url = Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey');
    final response = await http.get(url);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> articlesJson = json['articles'];
      //print(response.body);
      return articlesJson.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
