import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_short_item.dart';

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
    return Container(
      color: const Color(0xFFFAFAFA),
      child: RefreshIndicator(
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
                      onDelete: onDeleteArticle,
                    ),
                  );
                },
              ),
      ),
    );
  }
}