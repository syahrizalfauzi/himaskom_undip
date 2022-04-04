import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/notifikasi_pres.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifikasiPageContainer extends HookConsumerWidget {
  const NotifikasiPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(notifikasiArticleState);

    void _onTapArticle(Article article) => debugPrint(article.toString());

    return NotifikasiPagePresentational(
      articles: _articleState.articles,
      onRefresh: _articleState.getAll,
      isLoading: _articleState.isLoading,
      onTapArticle: _onTapArticle,
      onDeleteArticle: _onTapArticle,
    );
  }
}
