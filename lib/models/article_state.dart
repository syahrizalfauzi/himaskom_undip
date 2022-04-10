import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:http/http.dart' as http;

abstract class ArticleState extends ChangeNotifier {
  final String baseUrl = "https://himaskom-undip-backend.et.r.appspot.com/";
  final String fetchUrl = "";
  final String title = "Articles";
  List<Article> articles = [];
  bool isLoading = false;

  Future<void> getAll() async {
    isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(baseUrl + fetchUrl));
    final data = jsonDecode(response.body)["data"] as List?;

    if (response.statusCode == 404) {
      articles = [];
    } else if (data != null) {
      articles = data.map((e) => Article.fromJson(e)).toList();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<Article> get(String id) async {
    final response = await http.get(Uri.parse(baseUrl + '/articles/$id'));
    final article = Article.fromJson(jsonDecode(response.body)["data"]);

    final index = articles.indexWhere((e) => e.id == id);

    if (index == -1) {
      articles.insert(0, article);
    } else {
      articles[index] = article;
    }

    return article;
  }
}
