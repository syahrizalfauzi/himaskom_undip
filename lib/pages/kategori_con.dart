import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_tab_item.dart';
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
import 'package:himaskom_undip/widgets/article_state_builder.dart';
import 'package:himaskom_undip/widgets/user_scaffold.dart';
import 'package:himaskom_undip/widgets/article_list.dart';
import 'package:himaskom_undip/widgets/article_tab_view.dart';
import 'package:himaskom_undip/widgets/item_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KategoriPageContainer extends HookConsumerWidget {
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
  Widget build(BuildContext context, ref) {
    final _akademikState = ref.watch(akademikArticleState);
    final _beasiswaState = ref.watch(beasiswaArticleState);
    final _prestasiState = ref.watch(prestasiArticleState);
    final _sistoreState = ref.watch(sistoreArticleState);
    final _umumState = ref.watch(umumArticleState);
    final _eventStates = [
      ref.watch(eventAmArticleState),
      ref.watch(eventHmArticleState),
      ref.watch(eventUkmArticleState),
    ];
    final _karirStates = [
      ref.watch(karirLokerArticleState),
      ref.watch(karirMagangArticleState),
    ];
    final _lombaStates = [
      ref.watch(lombaAkademikArticleState),
      ref.watch(lombaNonakademikArticleState),
    ];

    void _handleTapAkademik() {
      pushArticleStatePage(
        context: context,
        state: akademikArticleState,
        title: "Akademik",
        builder: (item) => UserScaffold.withArticleList(
          tabItem: item,
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    void _handleTapBeasiswa() {
      pushArticleStatePage(
        context: context,
        state: beasiswaArticleState,
        title: "Beasiswa",
        builder: (item) => UserScaffold.withArticleList(
          tabItem: item,
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    void _handleTapPrestasi() {
      pushArticleStatePage(
        context: context,
        state: prestasiArticleState,
        title: "Prestasi",
        builder: (item) => UserScaffold.withArticleList(
          tabItem: item,
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    void _handleTapSistore() {
      pushArticleStatePage(
        context: context,
        state: sistoreArticleState,
        title: "Sistore",
        builder: (item) => UserScaffold.withArticleList(
          tabItem: item,
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
        ),
      );
    }

    void _handleTapUmum() {
      pushArticleStatePage(
        context: context,
        state: umumArticleState,
        title: "Umum",
        builder: (item) => UserScaffold.withArticleList(
          tabItem: item,
          onTapSearch: onTapSearch,
          onTapArticle: onTapArticle,
          onSaveArticle: onSaveArticle,
          onShareArticle: onShareArticle,
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
          title: "Title",
          builder: (state) => UserScaffold(
              title: "Event",
              onTapSearch: onTapSearch,
              child: ArticleTabView(
                items: _eventStates
                    .map((e) => ArticleTabItem.fromArticleState(e))
                    .toList(),
                onTapArticle: onTapArticle,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
              )));
    }

    void _handleTapKarir() {
      pushArticleStatesPage(
          context: context,
          states: [karirLokerArticleState, karirMagangArticleState],
          title: "Title",
          builder: (state) => UserScaffold(
              title: "Karir",
              onTapSearch: onTapSearch,
              child: ArticleTabView(
                items: _karirStates
                    .map((e) => ArticleTabItem.fromArticleState(e))
                    .toList(),
                onTapArticle: onTapArticle,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
              )));
    }

    void _handleTapLomba() {
      pushArticleStatesPage(
          context: context,
          states: [lombaAkademikArticleState, lombaNonakademikArticleState],
          title: "Title",
          builder: (state) => UserScaffold(
              title: "Lomba",
              onTapSearch: onTapSearch,
              child: ArticleTabView(
                items: _lombaStates
                    .map((e) => ArticleTabItem.fromArticleState(e))
                    .toList(),
                onTapArticle: onTapArticle,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
              )));
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
