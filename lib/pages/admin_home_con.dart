import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/pages/admin_home_pres.dart';
import 'package:himaskom_undip/pages/article_editor_con.dart';
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
import 'package:himaskom_undip/widgets/admin_scaffold.dart';
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
    _handleLogOut() => FirebaseAuth.instance.signOut();

    _handleTapAddArticle(ArticleStateItem stateItem) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AdminScaffold(
            title: stateItem.title,
            child: ArticleEditorPageContainer(stateItem: stateItem),
          ),
        ),
      );
    }

    _handleTapEvent() {
      for (final e in _eventStates) {
        e.getAll(false);
      }
      pushArticleStatesPage(
        context: context,
        states: [
          eventAmArticleState,
          eventHmArticleState,
          eventUkmArticleState
        ],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Event"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapSistore() {
      _sistoreState.getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [sistoreArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Sistore"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapBeasiswa() {
      _beasiswaState.getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [beasiswaArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Beasiswa"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapPrestasi() {
      _prestasiState.getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [prestasiArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Prestasi"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapAkademik() {
      _akademikState.getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [akademikArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Akademik"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapKarir() {
      for (final e in _karirStates) {
        e.getAll(false);
      }
      pushArticleStatesPage(
        context: context,
        states: [karirLokerArticleState, karirMagangArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Karir"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapLomba() {
      for (final e in _lombaStates) {
        e.getAll(false);
      }
      pushArticleStatesPage(
        context: context,
        states: [lombaAkademikArticleState, lombaNonakademikArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Lomba"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    _handleTapUmum() {
      _umumState.getAll(false);
      pushArticleStatesPage(
        context: context,
        states: [umumArticleState],
        builder: (states) => AdminScaffold.withArticleShortList(
          stateItem: ArticleStateItem.fromArticleStates(states, "Umum"),
          onTapAddArticle: _handleTapAddArticle,
          onTapArticle: onTapArticle,
          onDeleteArticle: onDeleteArticle,
        ),
      );
    }

    return AdminHomePagePresentational(
      onLogOut: _handleLogOut,
      items: [
        ArticleStateItem.fromArticleStates(
          _eventStates,
          'Event',
          _handleTapEvent,
        ),
        ArticleStateItem.fromArticleState(
          _sistoreState,
          _handleTapSistore,
        ),
        ArticleStateItem.fromArticleState(
          _beasiswaState,
          _handleTapBeasiswa,
        ),
        ArticleStateItem.fromArticleState(
          _prestasiState,
          _handleTapPrestasi,
        ),
        ArticleStateItem.fromArticleState(
          _akademikState,
          _handleTapAkademik,
        ),
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
        ArticleStateItem.fromArticleState(
          _umumState,
          _handleTapUmum,
        ),
      ],
    );
  }
}
