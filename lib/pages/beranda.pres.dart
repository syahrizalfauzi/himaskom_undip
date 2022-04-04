import 'package:flutter/material.dart';
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
import 'package:himaskom_undip/widgets/customtabview.dart';

class BerandaPagePresentational extends StatelessWidget {
  const BerandaPagePresentational({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTabView(items: [
      ArticleTabItem(state: [berandaArticleState], title: "Rekomendasi"),
      ArticleTabItem(state: [umumArticleState], title: "Umum"),
      ArticleTabItem(state: [
        eventAmArticleState,
        eventHmArticleState,
        eventUkmArticleState
      ], title: "Event"),
      ArticleTabItem(state: [sistoreArticleState], title: "Sistore"),
      ArticleTabItem(state: [beasiswaArticleState], title: "Beasiswa"),
      ArticleTabItem(state: [prestasiArticleState], title: "Prestasi"),
      ArticleTabItem(state: [akademikArticleState], title: "Akademik"),
      ArticleTabItem(
          state: [karirLokerArticleState, karirMagangArticleState],
          title: "Karir"),
      ArticleTabItem(
          state: [lombaAkademikArticleState, lombaNonakademikArticleState],
          title: "Lomba"),
    ]);
  }
}
