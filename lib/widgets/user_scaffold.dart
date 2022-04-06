import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/widgets/article_list.dart';
import 'package:himaskom_undip/widgets/article_tab_view.dart';
import 'package:himaskom_undip/widgets/item_grid.dart';

class UserScaffold extends StatelessWidget {
  final String title;
  final void Function() onTapSearch;
  final Widget child;

  const UserScaffold({
    Key? key,
    required this.title,
    required this.onTapSearch,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onTapSearch,
            icon: const Icon(Icons.search),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: child,
    );
  }

  factory UserScaffold.withItemGrid({
    required ArticleStateItem stateItem,
    required void Function() onTapSearch,
    required Function(Article) onTapItem,
  }) {
    return UserScaffold(
      title: stateItem.title,
      onTapSearch: onTapSearch,
      child: ItemGrid(
        articles: stateItem.articles,
        onRefresh: stateItem.onRefresh,
        isLoading: stateItem.isLoading,
        onTapItem: onTapItem,
      ),
    );
  }
  factory UserScaffold.withArticleList({
    required ArticleStateItem stateItem,
    required void Function() onTapSearch,
    required Function(Article) onTapArticle,
    required Function(Article) onSaveArticle,
    required Function(Article) onShareArticle,
    bool firstHighlight = false,
  }) {
    return UserScaffold(
      title: stateItem.title,
      onTapSearch: onTapSearch,
      child: ArticleList(
        articles: stateItem.articles,
        onRefresh: stateItem.onRefresh,
        isLoading: stateItem.isLoading,
        onTapArticle: onTapArticle,
        onSaveArticle: onSaveArticle,
        onShareArticle: onShareArticle,
        firstHighlight: firstHighlight,
      ),
    );
  }

  factory UserScaffold.withArticleTabView({
    required String title,
    required List<ArticleStateItem> stateItems,
    required void Function() onTapSearch,
    required Function(Article) onTapArticle,
    required Function(Article) onSaveArticle,
    required Function(Article) onShareArticle,
  }) {
    return UserScaffold(
      title: title,
      onTapSearch: onTapSearch,
      child: ArticleTabView(
        onTapArticle: onTapArticle,
        onSaveArticle: onSaveArticle,
        onShareArticle: onShareArticle,
        items: stateItems,
      ),
    );
  }
}
