import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/beranda.pres.dart';
import 'package:himaskom_undip/states/akademikarticle.dart';
import 'package:himaskom_undip/states/beasiswaarticle.dart';
import 'package:himaskom_undip/states/berandaarticle.dart';
import 'package:himaskom_undip/states/eventamarticle.dart';
import 'package:himaskom_undip/states/eventhmarticle.dart';
import 'package:himaskom_undip/states/eventukmarticle.dart';
import 'package:himaskom_undip/states/karirlokerarticle.dart';
import 'package:himaskom_undip/states/karirmagangarticle.dart';
import 'package:himaskom_undip/states/lombaakademikarticle.dart';
import 'package:himaskom_undip/states/lombanonakademikarticle.dart';
import 'package:himaskom_undip/states/prestasiarticle.dart';
import 'package:himaskom_undip/states/sistorearticle.dart';
import 'package:himaskom_undip/states/umumarticle.dart';
import 'package:himaskom_undip/utils/combinearticlestates.dart';
import 'package:himaskom_undip/widgets/customtabview.dart';
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
