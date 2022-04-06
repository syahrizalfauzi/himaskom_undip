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
import 'package:himaskom_undip/states/user_scaffold.dart';
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
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
                title: "Akademik",
                onTapSearch: onTapSearch,
                child: ArticleList(
                  articles: _akademikState.articles,
                  onRefresh: _akademikState.getAll,
                  isLoading: _akademikState.isLoading,
                  firstHighlight: true,
                  onSaveArticle: onSaveArticle,
                  onShareArticle: onShareArticle,
                  onTapArticle: onTapArticle,
                ),
              ))));
    }

    void _handleTapBeasiswa() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Beasiswa",
              onTapSearch: onTapSearch,
              child: ArticleList(
                articles: _beasiswaState.articles,
                onRefresh: _beasiswaState.getAll,
                isLoading: _beasiswaState.isLoading,
                firstHighlight: true,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
                onTapArticle: onTapArticle,
              )))));
    }

    void _handleTapPrestasi() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Prestasi",
              onTapSearch: onTapSearch,
              child: ArticleList(
                articles: _prestasiState.articles,
                onRefresh: _prestasiState.getAll,
                isLoading: _prestasiState.isLoading,
                firstHighlight: true,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
                onTapArticle: onTapArticle,
              )))));
    }

    void _handleTapSistore() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Sistore",
              onTapSearch: onTapSearch,
              child: ItemGrid(
                articles: _sistoreState.articles,
                onRefresh: _sistoreState.getAll,
                isLoading: _sistoreState.isLoading,
                onTapItem: onTapArticle,
              )))));
    }

    void _handleTapUmum() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Umum",
              onTapSearch: onTapSearch,
              child: ArticleList(
                articles: _umumState.articles,
                onRefresh: _umumState.getAll,
                isLoading: _umumState.isLoading,
                firstHighlight: true,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
                onTapArticle: onTapArticle,
              )))));
    }

    void _handleTapEvent() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Event",
              onTapSearch: onTapSearch,
              child: ArticleTabView(
                items: _eventStates
                    .map((e) => ArticleTabItem.fromArticleState(e))
                    .toList(),
                onTapArticle: onTapArticle,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
              )))));
    }

    void _handleTapKarir() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Karir",
              onTapSearch: onTapSearch,
              child: ArticleTabView(
                items: _karirStates
                    .map((e) => ArticleTabItem.fromArticleState(e))
                    .toList(),
                onTapArticle: onTapArticle,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
              )))));
    }

    void _handleTapLomba() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => UserScaffold(
              title: "Lomba",
              onTapSearch: onTapSearch,
              child: ArticleTabView(
                items: _lombaStates
                    .map((e) => ArticleTabItem.fromArticleState(e))
                    .toList(),
                onTapArticle: onTapArticle,
                onSaveArticle: onSaveArticle,
                onShareArticle: onShareArticle,
              )))));
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
