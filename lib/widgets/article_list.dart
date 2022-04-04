import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_card.dart';
import 'package:himaskom_undip/widgets/article_list_item.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapArticle;
  final Function(Article) onSaveArticle;
  final Function(Article) onShareArticle;
  final bool isLoading;
  final bool firstHighlight;

  const ArticleList({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTapArticle,
    required this.onSaveArticle,
    required this.onShareArticle,
    required this.isLoading,
    this.firstHighlight = false,
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
                Widget child;
                if (index == 0 && firstHighlight) {
                  child = Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ArticleCard(
                        article: articles[index],
                        onTap: onTapArticle,
                        onSave: onSaveArticle,
                        onShare: onShareArticle,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Info Terbaru',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )
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
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: index == 9 ? 16 : 0,
                  ),
                  child: child,
                );
              },
            ),
    );
  }
}
