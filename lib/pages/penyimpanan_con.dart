import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/penyimpanan_pres.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PenyimpananPageContainer extends HookConsumerWidget {
  final Function(Article) onTapArticle;

  const PenyimpananPageContainer({
    Key? key,
    required this.onTapArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(notifikasiArticleState);

    return PenyimpananPagePresentational(
      articles: _articleState.articles,
      isLoading: _articleState.isLoading,
      onRefresh: _articleState.getAll,
      onTapArticle: onTapArticle,
    );
  }
}
