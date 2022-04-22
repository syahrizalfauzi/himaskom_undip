import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:http/http.dart' as http;

class SearchArticleState extends ArticleState {
  @override
  final String fetchUrl = "search-articles";

  @override
  bool isLoading = false;

  String searchQuery = "";

  void clearArticles() {
    articles = [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> search(String keyword) async {
    isLoading = true;
    searchQuery = keyword;
    notifyListeners();

    final response =
        await http.get(Uri.parse('$baseUrl/$fetchUrl?query=$keyword'));
    final data = jsonDecode(response.body)["data"] as List?;

    if (response.statusCode == 404) {
      articles = [];
    } else if (data != null) {
      articles = data.map((e) => Article.fromJson(e)).toList();
    }
    debugPrint(articles.toString());

    isLoading = false;
    notifyListeners();
  }
}
