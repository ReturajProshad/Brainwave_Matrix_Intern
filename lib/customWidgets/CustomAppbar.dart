import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String headings;
  final where;
  final url;
  final ImageToUrl;
  Customappbar(
      {super.key,
      required this.headings,
      this.where,
      this.url,
      this.ImageToUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: Constants.instants.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          headings,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: Scaffold.of(context).openDrawer,
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          if (headings == Constants.instants.fromTopHome) ...[
            IconButton(
                onPressed: () {
                  Provider.of<NewsProvider>(context, listen: false).fetchNews();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                ))
          ],
          if (where == "W") ...[
            IconButton(
              onPressed: () {
                Provider.of<NewsProvider>(context, listen: false)
                    .addToBookMark(headings, url, ImageToUrl);
                showBookmarkAddedSnackbar(context);
              },
              icon: const Icon(
                Icons.bookmark_add,
                color: Colors.black,
              ),
            )
          ],
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  //Custom Snackbar
  void showBookmarkAddedSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Row(
        children: [
          Icon(Icons.bookmark, color: Colors.white),
          SizedBox(width: 10),
          Text(
            'Bookmark added!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      backgroundColor: Colors.greenAccent.shade700,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
