//import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutternews/models/article_model.dart';
import 'dart:convert';
//import 'package:flutternews/views/home.dart';

class News {
  List<ArticleModel> news = [];
  // ignore: non_constant_identifier_names
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=ffd87d4d604f431793a1cb059e902dcd";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["content"] != null &&
            element["author"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              content: element['content'],
              //publshedAt: element['publshedAt'],
              urlToImage: element["urlToImage"],
              url: element['url']);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  // ignore: non_constant_identifier_names
  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=ffd87d4d604f431793a1cb059e902dcd";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["content"] != null &&
            element["author"] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              content: element['content'],
              //publshedAt: element['publshedAt'],
              urlToImage: element["urlToImage"],
              url: element['url']);
          news.add(articleModel);
        }
      });
    }
  }
}
