import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/articleshortitem.dart';

class ArticleShortList extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapArticle;
  final bool isLoading;
  final bool isAdminVariant;

  const ArticleShortList({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTapArticle,
    this.isLoading = false,
    this.isAdminVariant = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: index == 9 ? 16 : 0,
                  ),
                  child: ArticleShortItem(
                    article: articles[index],
                    isAdminVariant: isAdminVariant,
                    onTap: onTapArticle,
                  ),
                );
              },
            ),
    );
  }
}
