import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/admin_home_pres.dart';
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

class AdminHomePageContainer extends HookConsumerWidget {
  final Function(Article) onTapArticle;
  final Function(Article) onDeleteArticle;

  const AdminHomePageContainer({
    Key? key,
    required this.onTapArticle,
    required this.onDeleteArticle,
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

    void _handleTapEvent() {}
    void _handleTapSistore() {}
    void _handleTapBeasiswa() {}
    void _handleTapPrestasi() {}
    void _handleTapAkademik() {}
    void _handleTapKarir() {}
    void _handleTapLomba() {}
    void _handleTapUmum() {}

    void _handleLogOut() {}

    return AdminHomePagePresentational(
      onLogOut: _handleLogOut,
      items: [
        ArticleStateItem.fromArticleStates(
          _eventStates,
          'Event',
          _handleTapEvent,
        ),
        ArticleStateItem.fromArticleState(_sistoreState, _handleTapSistore),
        ArticleStateItem.fromArticleState(_beasiswaState, _handleTapBeasiswa),
        ArticleStateItem.fromArticleState(_prestasiState, _handleTapPrestasi),
        ArticleStateItem.fromArticleState(_akademikState, _handleTapAkademik),
        ArticleStateItem.fromArticleStates(
          _karirStates,
          'Karir',
          _handleTapKarir,
        ),
        ArticleStateItem.fromArticleStates(
          _lombaStates,
          'Lomba',
          _handleTapLomba,
        ),
        ArticleStateItem.fromArticleState(_umumState, _handleTapUmum),
      ],
    );
  }
}
