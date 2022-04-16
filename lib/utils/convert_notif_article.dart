import 'dart:convert';

import 'package:himaskom_undip/models/article.dart';

List<Article> articleListFromEncodedArticles(List<String> storedArticles) {
  final ids = storedArticles
      .map((e) => jsonDecode(e))
      .map((e) => e['id'].toString())
      .toSet();

  return storedArticles
      .map((e) => Article.fromNotifJson(jsonDecode(e)))
      .where((e) => ids.contains(e.id))
      .toList();
}

List<String> encodedArticlesFromArticleList(List<Article> articleList) {
  return articleList.map((e) => jsonEncode(e.toNotifJson)).toList();
}

String encodedArticleFromNotifJson(Map<String, dynamic> notifJson) {
  return jsonEncode({
    'id': notifJson['id'],
    'judul': notifJson['judul'],
    'jenisId': notifJson['jenisId'].toString(),
  });
}
