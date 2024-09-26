import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/CustomAppbar.dart';
import 'package:news_app_with_rest_api/customWidgets/constants.dart';
import 'package:news_app_with_rest_api/customWidgets/drawer.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:news_app_with_rest_api/view/news_screen.dart';
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
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Categories('Business', Icons.business, context),
              _Categories('Education', Icons.business, context),
              _Categories('Weather', Icons.business, context),
              _Categories('Feature', Icons.business, context),
              _Categories('Sports', Icons.business, context),
              _Categories('Entertainment', Icons.business, context),
              _Categories('Politics', Icons.business, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Categories(String _title, IconData _icon, BuildContext _context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.8),
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        tileColor: Colors.transparent,
        leading: Icon(_icon, color: const Color.fromARGB(255, 12, 54, 126)),
        title: Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: const Color.fromARGB(255, 12, 54, 126),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            color: const Color.fromARGB(255, 12, 54, 126)),
        onTap: () async {
          Provider.of<NewsProvider>(_context, listen: false)
              .updateHeading(_title);
          Provider.of<NewsProvider>(_context, listen: false).loadArticles();
          Navigator.push(
              _context,
              MaterialPageRoute(
                  builder: (_context) => NewsScreen(
                        comeFrom: comeFrom, ////////NNNN
                      )));
        },
      ),
    );
  }
}
