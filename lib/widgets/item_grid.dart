import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/empty_article_widget.dart';
import 'package:himaskom_undip/widgets/item_card.dart';

class ItemGrid extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapItem;
  final bool isLoading;

  const ItemGrid({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTapItem,
    this.isLoading = false,
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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          padding: const EdgeInsets.all(16),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return ItemCard(
              article: articles[index],
              onTap: onTapItem,
            );
          },
        ),
      );
    }

    return child;
  }
}
