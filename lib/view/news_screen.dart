import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/CustomAppbar.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/customWidgets/drawer.dart';
import 'package:news_app_with_rest_api/model/articleModel.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:news_app_with_rest_api/view/news_details.dart';
import 'package:news_app_with_rest_api/view/webview/readFullArticle.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: Customappbar(headings: Constants.instants.fromTopHome),
      drawer: MyDrawer(),
      body: newsProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsProvider.articles.length,
              itemBuilder: (context, index) {
                final article = newsProvider.articles[index];
                print(article.urlToImage);
                //if (article.urlToImage != '') {
                return _ListTile(article, context);
                //} else
                //  return Container();
              },
            ),
    );
  }

  Widget _ListTile(Article article, BuildContext context) {
    return ListTile(
      leading: article.urlToImage != ''
          ? Image.network(
              article.urlToImage,
              width: 100,

              /// fit: BoxFit.cover,
            )
          : Container(
              width: 100,
              color: Colors.grey,
              child: const Text(
                "No Image Found",
                style: TextStyle(color: Colors.red),
              ),
            ),
      title: Card(
        elevation: 4, // Add shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            article.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
      // subtitle: Text(
      //   article.description,
      //   style: TextStyle(
      //     color: Colors.grey[700], // Subtitle color
      //   ),
      // ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReadFullArticle(
              articleURL: article.url,
              Title: article.title,
            ),
          ),
        );
      },
    );
  }
}
