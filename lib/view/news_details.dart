import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/model/articleModel.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  NewsDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.urlToImage != ''
              ? Image.network(article.urlToImage)
              : Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.description,
              style: TextStyle(fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Launch the news article URL in the browser
            },
            child: Text('Read Full Article'),
          ),
        ],
      ),
    );
  }
}
