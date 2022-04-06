import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/states/akademik_article.dart';
import 'package:himaskom_undip/states/beasiswa_article.dart';
import 'package:himaskom_undip/states/event_am_article.dart';
import 'package:himaskom_undip/states/event_hm_article.dart';
import 'package:himaskom_undip/states/event_ukm_article.dart';
import 'package:himaskom_undip/states/karir_loker_article.dart';
import 'package:himaskom_undip/states/karir_magang_article.dart';
import 'package:himaskom_undip/states/lomba_akademik_article.dart';
import 'package:himaskom_undip/states/lomba_nonakademik_article.dart';
import 'package:himaskom_undip/states/prestasi_article.dart';
import 'package:himaskom_undip/states/sistore_article.dart';
import 'package:himaskom_undip/states/umum_article.dart';
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
