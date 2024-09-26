import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:news_app_with_rest_api/view/webview/readFullArticle.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  String comeFrom;
  BookmarkScreen({required this.comeFrom});
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final bookmarks = newsProvider.addToBookMarkList.toList();

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Provider.of<NewsProvider>(context, listen: false)
            .updateHeading(comeFrom);
        if (comeFrom != '' && comeFrom != Constants.instants.fromCateGory) {
          Provider.of<NewsProvider>(context, listen: false).loadArticles();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookmarks'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: bookmarks.isEmpty
            ? const Center(
                child: Text(
                  "No bookmarks yet!",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  final bookmark = bookmarks[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: bookmark.imageToUrl.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                bookmark.imageToUrl,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              width: 100,
                              color: Colors.grey,
                              child: const Center(
                                child: Text(
                                  "No Image",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                      title: Text(
                        bookmark.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Open Article Button
                          IconButton(
                            icon: const Icon(
                              Icons.open_in_new,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReadFullArticle(
                                    articleURL: bookmark.url,
                                    Title: bookmark.title,
                                    ImageToUrl: bookmark.imageToUrl,
                                  ),
                                ),
                              );
                            },
                          ),
                          // Delete Bookmark Button
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Provider.of<NewsProvider>(context, listen: false)
                                  .deleteBookmark(bookmark);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
