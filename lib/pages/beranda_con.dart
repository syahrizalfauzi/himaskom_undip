import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/beranda_pres.dart';
import 'package:himaskom_undip/states/akademik_article.dart';
import 'package:himaskom_undip/states/beasiswa_article.dart';
import 'package:himaskom_undip/states/beranda_article.dart';
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
import 'package:himaskom_undip/utils/combine_article_states.dart';
import 'package:himaskom_undip/widgets/custom_tab_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BerandaPageContainer extends HookConsumerWidget {
  const BerandaPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleStates = [
      ref.watch(berandaArticleState),
      ref.watch(akademikArticleState),
      ref.watch(beasiswaArticleState),
      ref.watch(prestasiArticleState),
      ref.watch(sistoreArticleState),
      ref.watch(umumArticleState),
    ];

    final _eventArticleStates = [
      ref.watch(eventAmArticleState),
      ref.watch(eventHmArticleState),
      ref.watch(eventUkmArticleState),
    ];
    final _karirArticleStates = [
      ref.watch(karirLokerArticleState),
      ref.watch(karirMagangArticleState),
    ];
    final _lombaArticleStates = [
      ref.watch(lombaAkademikArticleState),
      ref.watch(lombaNonakademikArticleState),
    ];

    void _onTapArticle(Article article) => debugPrint(article.toString());

    return BerandaPagePresentational(
      onSaveArticle: _onTapArticle,
      onShareArticle: _onTapArticle,
      onTapArticle: _onTapArticle,
      articleTabItems: [
        ..._articleStates
            .map(
              (e) => ArticleTabItem(
                articles: e.articles,
                title: e.title,
                isLoading: e.isLoading,
                onRefresh: e.fetch,
              ),
            )
            .toList(),
        combineArticleStates(_eventArticleStates, "Event"),
        combineArticleStates(_karirArticleStates, "Karir"),
        combineArticleStates(_lombaArticleStates, "Lomba"),
      ],
    );
  }
}
