import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/admin_pres.dart';
import 'package:himaskom_undip/pages/article_editor_con.dart';
import 'package:himaskom_undip/utils/get_article_state.dart';
import 'package:himaskom_undip/widgets/admin_scaffold.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminContainer extends ConsumerWidget {
  const AdminContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    _handleTapArticle(Article article) {
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

    _handleDeleteArticle(Article article) async {
      final isDeleted = await showDialog<bool>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Hapus Article / Item'),
              content: Text(
                'Yakin ingin menghapus article / item berjudul "${article.judul}"?\n\nID : ${article.id}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Batal',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Hapus',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ),
              ],
            ),
          ) ??
          false;

      if (!isDeleted) {
        return;
      }

      final articleState = ref.read(getArticleStateFromArticle(article));
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      try {
        await Future.wait([
          articleState.delete(article: article, token: token),
          ...article.gambarUrl!
              .map((e) => FirebaseStorage.instance.refFromURL(e).delete()),
        ]);
      } catch (e) {
        debugPrint(e.toString());
      }

      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackbar('Berhasil menghapus "${article.judul}"'),
      );
    }

    return AdminPresentational(
      onTapArticle: _handleTapArticle,
      onDeleteArticle: _handleDeleteArticle,
    );
  }
}
