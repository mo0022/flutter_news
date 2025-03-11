import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_pp/Data/api_model.dart';

class News {
  Future<List<NewsModel>> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2025-03-08&to=2025-03-08&sortBy=popularity&apiKey=01ca85c2b71b4a31ad3589fb810d3d0c";
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parsing the JSON response and converting it to a list of articles
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
