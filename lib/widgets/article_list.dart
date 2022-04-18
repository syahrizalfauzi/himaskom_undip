import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_card.dart';
import 'package:himaskom_undip/widgets/article_list_item.dart';
import 'package:himaskom_undip/widgets/empty_article_widget.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function()? onRefresh;
  final Function(Article) onTapArticle;
  final Function(Article)? onSaveArticle;
  final Function(Article)? onShareArticle;
  final bool isLoading;
  final bool firstHighlight;
  final bool showEmpty;

  const ArticleList({
    Key? key,
    required this.articles,
    required this.onTapArticle,
    required this.isLoading,
    this.onRefresh,
    this.onSaveArticle,
    this.onShareArticle,
    this.firstHighlight = false,
    this.showEmpty = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isLoading) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (articles.isEmpty && showEmpty) {
      child = EmptyArticleWidget(onRefresh: onRefresh);
    } else {
      child = ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Widget child;
          if (index == 0 && firstHighlight) {
            child = Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArticleCard(
                  article: articles[index],
                  onTap: onTapArticle,
                  onSave: onSaveArticle!,
                  onShare: onShareArticle!,
                ),
                if (articles.length > 1) ...[
                  const SizedBox(height: 32),
                  const Text(
                    'Info Terbaru',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                ]
              ],
            );
          } else {
            child = ArticleListItem(
              article: articles[index],
              onTap: onTapArticle,
            );
          }

          return Padding(
            padding: EdgeInsets.only(
              left: firstHighlight && index == 0 ? 24 : 0,
              right: firstHighlight && index == 0 ? 24 : 0,
              top: 16,
              bottom: index == 9 ? 16 : 0,
            ),
            child: child,
          );
        },
      );
    }

    if (onRefresh != null) {
      return RefreshIndicator(child: child, onRefresh: onRefresh!);
    }

    return child;
  }
}
