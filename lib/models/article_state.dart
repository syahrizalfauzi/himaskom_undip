import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:http/http.dart' as http;

abstract class ArticleState extends ChangeNotifier {
  final String baseUrl = "https://himaskom-undip-backend.et.r.appspot.com";
  final String fetchUrl = "";
  final String title = "Articles";
  List<Article> articles = [];
  bool isLoading = true;

  Future<void> getAll([bool notify = true]) async {
    if (notify) {
      isLoading = true;
      notifyListeners();
    }
    final response = await http.get(Uri.parse('$baseUrl/$fetchUrl'));
    final data = jsonDecode(response.body)["data"] as List?;

    if (response.statusCode == 404) {
      articles = [];
    } else if (data != null) {
      articles = data.map((e) => Article.fromJson(e)).toList();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<Article?> get(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/articles/$id'));

    try {
      final article = Article.fromJson(jsonDecode(response.body)["data"]);

      final index = articles.indexWhere((e) => e.id == id);

      if (index == -1) {
        articles.insert(0, article);
      } else {
        articles[index] = article;
      }

      return article;
    } catch (e) {
      return null;
    }
  }

  Future<void> delete({required Article article, required String token}) async {
    isLoading = true;
    notifyListeners();

    await http.delete(
      Uri.parse('$baseUrl/articles/${article.id}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    articles.removeWhere((e) => e.id == article.id);
    isLoading = false;
    notifyListeners();
  }

  @nonVirtual
  Future<String?> add({
    required Article article,
    required String token,
  }) async {
    isLoading = true;
    notifyListeners();

    final response = await http.post(
      Uri.parse(
        '$baseUrl/articles',
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(article.toJson),
    );

    switch (response.statusCode) {
      case 400:
        return "Data tidak lengkap, mohon cek ulang";
      case 403:
        return "Token tidak valid, silahkan log in kembali";
      case 500:
        return "Gagal menghubungi server, silahkan coba lagi";
    }

    final id = jsonDecode(response.body)["data"]["id"] as String;
    if (articles.isEmpty) {
      articles.add(article.copyWith(id: id));
    } else {
      articles.insert(articles.length - 1, article.copyWith(id: id));
    }
    isLoading = false;
    notifyListeners();
    return null;
  }

  @nonVirtual
  Future<String?> update({
    required Article article,
    required String token,
  }) async {
    isLoading = true;
    notifyListeners();

    if (article.id == null) return "ID Kosong";

    final response = await http.put(
      Uri.parse(
        '$baseUrl/articles/${article.id!}',
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(article.toJson),
    );

    switch (response.statusCode) {
      case 400:
        return "Data tidak lengkap, mohon cek ulang";
      case 403:
        return "Token tidak valid, silahkan log in kembali";
      case 404:
        return "Article / item tidak ditemukan";
      case 500:
        return "Gagal menghubungi server, silahkan coba lagi";
    }

    final index = articles.indexWhere((e) => e.id == article.id);
    if (index != -1) {
      articles[articles.indexWhere((e) => e.id == article.id)] = article;
    } else {
      if (articles.isEmpty) {
        articles.add(article);
      } else {
        articles.insert(articles.length - 1, article);
      }
    }
    isLoading = false;
    notifyListeners();
    return null;
  }

  @nonVirtual
  void removeArticleOnList(Article article) {
    articles.removeWhere((e) => e.id == article.id);
  }

  @nonVirtual
  void checkSaved(List<Article> savedArticles) {
    articles = articles.map((article) {
      final index = savedArticles.indexWhere((e) => e.id == article.id);

      return article.copyWith(isSaved: index == -1 ? false : true);
    }).toList();
    notifyListeners();
  }

  @nonVirtual
  void setIsSaved(Article article, bool isSaved) {
    final index = articles.indexWhere((e) => e.id == article.id);

    if (index != -1) {
      articles[index] = articles[index].copyWith(isSaved: isSaved);
      notifyListeners();
    }
  }
}
