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

    Future<void> _handleDeleteArticle(Article article) async {
      final isDeleted = await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Hapus Article / Item'),
          content: Text(
            'Yakin ingin menghapus article / item berjudul "${article.judul}"?\n\nID : ${article.id}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Batal',
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Hapus',
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
            ),
          ],
        ),
      );
    }

    return AdminPresentational(
      onTapArticle: _handleTapArticle,
      onDeleteArticle: _handleDeleteArticle,
    );
  }
}
