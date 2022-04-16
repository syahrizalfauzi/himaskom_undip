import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/providers/article_states.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

ChangeNotifierProvider<ArticleState> getArticleStateFromArticle(
    Article article) {
  switch (article.jenis) {
    case ArticleCategory.umum:
      return umumArticleState;
    case ArticleCategory.eventHm:
      return eventHmArticleState;
    case ArticleCategory.eventAm:
      return eventAmArticleState;
    case ArticleCategory.eventUkm:
      return eventUkmArticleState;
    case ArticleCategory.sistore:
      return sistoreArticleState;
    case ArticleCategory.beasiswa:
      return beasiswaArticleState;
    case ArticleCategory.prestasi:
      return prestasiArticleState;
    case ArticleCategory.akademik:
      return akademikArticleState;
    case ArticleCategory.karirLoker:
      return karirLokerArticleState;
    case ArticleCategory.karirMagang:
      return karirMagangArticleState;
    case ArticleCategory.lombaAkademik:
      return lombaAkademikArticleState;
    case ArticleCategory.lombaNonakademik:
      return lombaNonakademikArticleState;
  }
}
