import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/beranda_pres.dart';
import 'package:himaskom_undip/states/beranda_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BerandaPageContainer extends HookConsumerWidget {
  const BerandaPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _berandaArticle = ref.watch(berandaArticleState);

    void _onSaveArticle(Article article) {}
    void _onShareArticle(Article article) {}
    void _onTapArticle(Article article) => debugPrint(article.toString());

    return BerandaPagePresentational(
      onSaveArticle: _onSaveArticle,
      onShareArticle: _onShareArticle,
      onTapArticle: _onTapArticle,
      articles: _berandaArticle.articles,
      isLoading: _berandaArticle.isLoading,
      onRefresh: _berandaArticle.getAll,
    );
  }
}
