import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/CustomAppbar.dart';
import 'package:news_app_with_rest_api/model/articleModel.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:news_app_with_rest_api/view/news_details.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: Customappbar(headings: "Top Headlines"),
      body: newsProvider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsProvider.articles.length,
              itemBuilder: (context, index) {
                final article = newsProvider.articles[index];
                print(article.description);
                return Card(
                  child: ListTile(
                    leading: article.urlToImage != ''
                        ? Image.network(article.urlToImage,
                            width: 100, fit: BoxFit.cover)
                        : Container(width: 100, color: Colors.grey),
                    title: Text(article.title),
                    subtitle: Text(article.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailScreen(article: article),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
