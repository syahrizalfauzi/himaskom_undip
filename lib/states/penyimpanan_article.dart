import 'dart:convert';

import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final penyimpananArticleState =
    ChangeNotifierProvider((_) => PenyimpananArticleState());

class PenyimpananArticleState extends ArticleState {
  @override
  final String title = "Penyimpanan";
  @override
  final String fetchUrl = "articles/saved";
  String? _uid;
  set uid(String uid) => _uid = uid;
  @override
  bool isLoading = false;

  @override
  Future<void> getAll([bool notify = true]) async {
    if (_uid == null) {
      return;
    }

    if (notify) {
      isLoading = true;
      notifyListeners();
    }
    final response = await http.get(Uri.parse('$baseUrl/$fetchUrl/$_uid'));
    final data = jsonDecode(response.body)["data"] as List?;

    if (response.statusCode == 404) {
      articles = [];
    } else if (data != null) {
      articles =
          data.map((e) => Article.fromJson(e).copyWith(isSaved: true)).toList();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> save({required Article article, required String token}) async {
    isLoading = true;
    notifyListeners();

    await http.post(
      Uri.parse(
        '$baseUrl/$fetchUrl/$_uid',
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'articleId': article.id!}),
    );

    if (articles.isEmpty) {
      articles.add(article.copyWith(isSaved: true));
    } else {
      if (!articles.any((e) => e.id == article.id)) {
        articles.insert(articles.length - 1, article.copyWith(isSaved: true));
      }
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> unsave({required Article article, required String token}) async {
    isLoading = true;
    notifyListeners();

    await http.delete(
      Uri.parse(
        '$baseUrl/$fetchUrl/$_uid/${article.id}',
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    articles.removeWhere((e) => e.id == article.id);

    isLoading = false;
    notifyListeners();
  }

  bool checkSavedSingle(Article article) {
    return articles.indexWhere((e) => article.id == e.id) != -1;
  }
}
