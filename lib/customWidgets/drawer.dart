import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:news_app_with_rest_api/view/category.dart';
import 'package:news_app_with_rest_api/view/news_screen.dart';
import 'package:news_app_with_rest_api/view/show_bookmarks.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String _currentheading = Provider.of<NewsProvider>(context).currentHeading;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: Constants.instants.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(Constants.instants.DrawerImage),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              if (_currentheading != Constants.instants.fromTopHome) {
                Provider.of<NewsProvider>(context, listen: false)
                    .updateHeading(Constants.instants.fromTopHome);
                Provider.of<NewsProvider>(context, listen: false)
                    .loadArticles();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(
                        comeFrom: _currentheading,
                      ),
                    ));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.category, color: Colors.orange),
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
              if (_currentheading != "Categories") {
                Provider.of<NewsProvider>(context, listen: false)
                    .updateHeading('Categories');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryPage(
                              head: 'Categories',
                              comeFrom: _currentheading,
                            )));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: Colors.red),
            title: const Text('Bookmarks'),
            onTap: () {
              Navigator.pop(context);
              if (_currentheading != 'Bookmarks') {
                Provider.of<NewsProvider>(context, listen: false)
                    .updateHeading('Categories');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookmarkScreen(
                            comeFrom: _currentheading,
                          )),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.green),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.grey),
            title: const Text('Exit'),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
    ;
  }
}
