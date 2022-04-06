import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/widgets/article_short_list.dart';

class AdminScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final void Function()? onTapFab;

  const AdminScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.onTapFab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      floatingActionButton: onTapFab != null
          ? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 12, 60),
              child: FloatingActionButton(
                onPressed: onTapFab,
                child: const Icon(Icons.add),
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
    );
  }

  factory AdminScaffold.withArticleShortList({
    required ArticleStateItem stateItem,
    required Function(Article) onTapArticle,
    required Function(Article) onDeleteArticle,
    required void Function() onTapAddArticle,
  }) {
    return AdminScaffold(
      title: stateItem.title,
      onTapFab: onTapAddArticle,
      child: ArticleShortList(
        articles: stateItem.articles,
        onRefresh: stateItem.onRefresh,
        onTapArticle: onTapArticle,
        onDeleteArticle: onDeleteArticle,
        isLoading: stateItem.isLoading,
        isAdminVariant: true,
      ),
    );
  }
}
