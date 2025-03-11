import 'package:flutter/material.dart';
import 'package:new_pp/Data/api_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Initialize controller for better control of the WebView
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as NewsModel?;

    if (article == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Article Details"),
          backgroundColor: Colors.white,
        ),
        body: const Center(
          child: Text("No article data available."),
        ),
      );
    }

    if (article.url != null) {
      _webViewController.loadRequest(Uri.parse(article.url!));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Article Details"),
        backgroundColor: Colors.white,
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
