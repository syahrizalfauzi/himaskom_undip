import 'dart:convert';

import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final notifikasiArticleState =
    ChangeNotifierProvider((_) => NotifikasiArticleState());

class NotifikasiArticleState extends ArticleState {
  @override
  final String title = "Penyimpanan";
  @override
  final String fetchUrl = "articles/saved/";
  String? _uid;
  set uid(String uid) => _uid = uid;

  @override
  Future<void> getAll() async {
    if (_uid == null) {
      return;
    }

    isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(baseUrl + fetchUrl + _uid!));
    final data = jsonDecode(response.body)["data"] as List?;

    if (response.statusCode == 404) {
      articles = [];
    } else if (data != null) {
      articles = data.map((e) => Article.fromJson(e)).toList();
    }
    isLoading = false;
    notifyListeners();
  }
}
