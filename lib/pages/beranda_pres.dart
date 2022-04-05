import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_list.dart';

class BerandaPagePresentational extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final bool isLoading;
  final Function(Article) onTapArticle;
  final Function(Article) onSaveArticle;
  final Function(Article) onShareArticle;

  const BerandaPagePresentational({
    Key? key,
    required this.onTapArticle,
    required this.onSaveArticle,
    required this.onShareArticle,
    required this.articles,
    required this.onRefresh,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleList(
      articles: articles,
      onRefresh: onRefresh,
      isLoading: isLoading,
      onSaveArticle: onSaveArticle,
      onShareArticle: onShareArticle,
      onTapArticle: onTapArticle,
      firstHighlight: true,
    );
  }
}
