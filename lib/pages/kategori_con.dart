import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/kategori_pres.dart';
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
import 'package:himaskom_undip/utils/push_article_state_page.dart';
import 'package:himaskom_undip/widgets/user_scaffold.dart';

class KategoriPageContainer extends StatelessWidget {
  final void Function() onTapSearch;
  final Function(Article) onTapArticle;
  final Function(Article) onSaveArticle;
  final Function(Article) onShareArticle;

  const KategoriPageContainer({
    Key? key,
    required this.onTapSearch,
    required this.onTapArticle,
    required this.onSaveArticle,
    required this.onShareArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTapAkademik() {
      pushArticleStatesPage(
        context: context,
        states: [akademikArticleState],
        builder: (items) => UserScaffold.withArticleList(
          tabItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    void _handleTapBeasiswa() {
      pushArticleStatesPage(
        context: context,
        states: [beasiswaArticleState],
        builder: (items) => UserScaffold.withArticleList(
          tabItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    void _handleTapPrestasi() {
      pushArticleStatesPage(
        context: context,
        states: [prestasiArticleState],
        builder: (items) => UserScaffold.withArticleList(
          tabItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    void _handleTapSistore() {
      pushArticleStatesPage(
        context: context,
        states: [sistoreArticleState],
        builder: (items) => UserScaffold.withArticleList(
          tabItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    void _handleTapUmum() {
      pushArticleStatesPage(
        context: context,
        states: [umumArticleState],
        builder: (items) => UserScaffold.withArticleList(
          tabItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    void _handleTapEvent() {
      pushArticleStatesPage(
        context: context,
        states: [
          eventAmArticleState,
          eventHmArticleState,
          eventUkmArticleState
        ],
        builder: (states) => UserScaffold.withArticleTabView(
          title: "Event",
          onTapSearch: onTapSearch,
          tabItems:
              states.map((e) => ArticleStateItem.fromArticleState(e)).toList(),
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    void _handleTapKarir() {
      pushArticleStatesPage(
        context: context,
        states: [karirLokerArticleState, karirMagangArticleState],
        builder: (states) => UserScaffold.withArticleTabView(
          title: "Karir",
          onTapSearch: onTapSearch,
          tabItems:
              states.map((e) => ArticleStateItem.fromArticleState(e)).toList(),
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    void _handleTapLomba() {
      pushArticleStatesPage(
        context: context,
        states: [lombaAkademikArticleState, lombaNonakademikArticleState],
        builder: (states) => UserScaffold.withArticleTabView(
          title: "Lomba",
          onTapSearch: onTapSearch,
          tabItems:
              states.map((e) => ArticleStateItem.fromArticleState(e)).toList(),
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    return KategoriPagePresentational(
      onTapAkademik: _handleTapAkademik,
      onTapBeasiswa: _handleTapBeasiswa,
      onTapPrestasi: _handleTapPrestasi,
      onTapSistore: _handleTapSistore,
      onTapUmum: _handleTapUmum,
      onTapEvent: _handleTapEvent,
      onTapKarir: _handleTapKarir,
      onTapLomba: _handleTapLomba,
    );
  }
}
