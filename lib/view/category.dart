import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/CustomAppbar.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/customWidgets/drawer.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String head;
  final String comeFrom;
  CategoryPage({super.key, required this.head, required this.comeFrom});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<NewsProvider>(context).currentHeading);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          Provider.of<NewsProvider>(context, listen: false)
              .updateHeading(comeFrom);
        }
      },
      child: Scaffold(
        appBar: Customappbar(headings: head),
        drawer: MyDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Constants.instants.catColor,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Business'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
