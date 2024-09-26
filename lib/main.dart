import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/provider/news_provider.dart';
import 'package:news_app_with_rest_api/view/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter News API',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsScreen(
          comeFrom: '',
        ),
      ),
    );
  }
}
