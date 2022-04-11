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
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KategoriPageContainer extends HookConsumerWidget {
  final Function() onTapSearch;
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
  Widget build(BuildContext context, ref) {
    _handleTapAkademik() {
      ref.read(akademikArticleState).getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [akademikArticleState],
        builder: (items) => UserScaffold.withArticleList(
          stateItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    _handleTapBeasiswa() {
      ref.read(beasiswaArticleState).getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [beasiswaArticleState],
        builder: (items) => UserScaffold.withArticleList(
          stateItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    _handleTapPrestasi() {
      ref.read(prestasiArticleState).getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [prestasiArticleState],
        builder: (items) => UserScaffold.withArticleList(
          stateItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    _handleTapSistore() {
      ref.read(sistoreArticleState).getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [sistoreArticleState],
        builder: (items) => UserScaffold.withArticleList(
          stateItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    _handleTapUmum() {
      ref.read(umumArticleState).getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [umumArticleState],
        builder: (items) => UserScaffold.withArticleList(
          stateItem: ArticleStateItem.fromArticleState(items[0]),
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
          firstHighlight: true,
        ),
      );
    }

    _handleTapEvent() {
      final states = [
        eventAmArticleState,
        eventHmArticleState,
        eventUkmArticleState
      ];

      for (final e in states) {
        ref.read(e).getAll(false);
      }
      pushArticleStatesPage(
        context: context,
        states: states,
        builder: (states) => UserScaffold.withArticleTabView(
          title: "Event",
          onTapSearch: onTapSearch,
          stateItems:
              states.map((e) => ArticleStateItem.fromArticleState(e)).toList(),
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    _handleTapKarir() {
      final states = [karirLokerArticleState, karirMagangArticleState];

      for (final e in states) {
        ref.read(e).getAll(false);
      }
      pushArticleStatesPage(
        context: context,
        states: states,
        builder: (states) => UserScaffold.withArticleTabView(
          title: "Karir",
          onTapSearch: onTapSearch,
          stateItems:
              states.map((e) => ArticleStateItem.fromArticleState(e)).toList(),
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    _handleTapLomba() {
      final states = [lombaAkademikArticleState, lombaNonakademikArticleState];

      for (final e in states) {
        ref.read(e).getAll(false);
      }
      pushArticleStatesPage(
        context: context,
        states: states,
        builder: (states) => UserScaffold.withArticleTabView(
          title: "Lomba",
          onTapSearch: onTapSearch,
          stateItems:
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
