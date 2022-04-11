import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_short_item.dart';
import 'package:himaskom_undip/widgets/empty_article_widget.dart';

class ArticleShortList extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapArticle;
  final Function(Article) onDeleteArticle;
  final bool isLoading;
  final bool isAdminVariant;

  const ArticleShortList({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTapArticle,
    required this.onDeleteArticle,
    required this.isLoading,
    required this.isAdminVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isLoading) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (articles.isEmpty) {
      child = EmptyArticleWidget(onRefresh: onRefresh);
    } else {
      child = RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 24,
                right: 24,
                bottom: index == articles.length - 1 ? 16 : 0,
              ),
              child: ArticleShortItem(
                article: articles[index],
                isAdminVariant: isAdminVariant,
                onTap: onTapArticle,
                onDelete: onDeleteArticle,
              ),
            );
          },
        ),
      );
    }
    return Container(
      color: const Color(0xFFFAFAFA),
      child: child,
    );
  }
}
