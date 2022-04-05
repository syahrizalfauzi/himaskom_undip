import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_list.dart';

class PenyimpananPagePresentational extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapArticle;
  final bool isLoading;

  const PenyimpananPagePresentational({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTapArticle,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleList(
      firstHighlight: false,
      isLoading: isLoading,
      onRefresh: onRefresh,
      articles: articles,
      onTapArticle: onTapArticle,
    );
  }
}
