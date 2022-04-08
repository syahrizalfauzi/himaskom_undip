import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/admin_pres.dart';
import 'package:himaskom_undip/pages/article_editor_con.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:himaskom_undip/widgets/admin_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminContainer extends ConsumerWidget {
  const AdminContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    void _handleTapArticle(Article article) {
      final articleState = ref.read(getArticleStateFromArticle(article));
      final stateItem = ArticleStateItem.fromArticleState(articleState);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AdminScaffold(
            title: article.jenisString,
            child: ArticleEditorPageContainer(
              stateItem: stateItem,
              initialArticle: article,
            ),
          ),
        ),
      );
    }

    void _handleDeleteArticle(Article article) {}

    return AdminPresentational(
      onTapArticle: _handleTapArticle,
      onDeleteArticle: _handleDeleteArticle,
    );
  }
}
