import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  final String headings;
  Customappbar({super.key, required this.headings});

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
}
