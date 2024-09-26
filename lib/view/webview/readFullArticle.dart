import 'package:flutter/material.dart';
import 'package:news_app_with_rest_api/customWidgets/CustomAppbar.dart';
import 'package:news_app_with_rest_api/customWidgets/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadFullArticle extends StatefulWidget {
  final String articleURL;
  final String Title;
  ReadFullArticle({super.key, required this.articleURL, required this.Title});

  @override
  State<ReadFullArticle> createState() => _ReadFullArticleState();
}

class _ReadFullArticleState extends State<ReadFullArticle> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView loading progress: $progress%');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('Blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.articleURL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: Customappbar(
        headings: widget.Title,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
