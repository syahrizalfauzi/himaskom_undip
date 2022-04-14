import 'dart:convert';

import 'package:himaskom_undip/models/article.dart';

List<Article> articleListFromEncodedArticles(List<String> storedArticles) {
  return storedArticles
      .map((e) => Article.fromNotifJson(jsonDecode(e)))
      .toList();
}

List<String> encodedArticlesFromArticleList(List<Article> articleList) {
  return articleList.map((e) => jsonEncode(e.toNotifJson)).toList();
}

String encodedArticleFromNotifJson(Map<String, dynamic> notifJson) {
  return jsonEncode(notifJson);
}
