import 'package:himaskom_undip/models/article.dart';

void Function() getArticleCallback(
    Function(Article) callback, Article article) {
  return () => callback(article);
}
