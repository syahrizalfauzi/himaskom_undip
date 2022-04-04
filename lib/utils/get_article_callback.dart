// ignore_for_file: file_names

import 'package:himaskom_undip/models/article.dart';

void Function() getArticleCallback(
    Function(Article)? function, Article article) {
  if (function != null) {
    return () => function(article);
  }
  return () {};
}
