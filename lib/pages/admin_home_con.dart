import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/models/article_tab_item.dart';
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
import 'package:himaskom_undip/widgets/admin_scaffold.dart';
import 'package:himaskom_undip/widgets/article_short_list.dart';
import 'package:himaskom_undip/widgets/article_state_builder.dart';
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

    final _eventItem = useMemoized(
        () => ArticleTabItem.fromArticleStates(_eventStates, "Event"),
        [_eventStates]);
    final _karirItem = useMemoized(
        () => ArticleTabItem.fromArticleStates(_karirStates, "Karir"),
        [_eventStates]);
    final _lombaItem = useMemoized(
        () => ArticleTabItem.fromArticleStates(_lombaStates, "Lomba"),
        [_eventStates]);

    void _handleTapEvent() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AdminScaffold(
            title: 'Event',
            child: ArticleShortList(
              articles: _eventItem.articles,
              onRefresh: _eventItem.onRefresh,
              onTapArticle: onTapArticle,
              onDeleteArticle: onDeleteArticle,
              isLoading: _eventItem.isLoading,
              isAdminVariant: true,
            ),
          ),
        ),
      );
    }

    void _handleTapSistore() {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //       builder: (context) => ArticleStateBuilder(
      //           state: sistoreArticleState,
      //           builder: (state) {
      //             return AdminScaffold(
      //               title: 'Sistore',
      //               child: ArticleShortList(
      //                 articles: state.articles,
      //                 onRefresh: state.getAll,
      //                 onTapArticle: onTapArticle,
      //                 onDeleteArticle: onDeleteArticle,
      //                 isLoading: state.isLoading,
      //                 isAdminVariant: true,
      //               ),
      //             );
      //           })
      // HookConsumer(builder: (_, ref, __) {
      //   final _state = ref.watch(sistoreArticleState);

      //   return AdminScaffold(
      //     title: 'Sistore',
      //     child: ArticleShortList(
      //       articles: _state.articles,
      //       onRefresh: _state.getAll,
      //       onTapArticle: onTapArticle,
      //       onDeleteArticle: onDeleteArticle,
      //       isLoading: _state.isLoading,
      //       isAdminVariant: true,
      //     ),
      //   );
      // }),
      //       ),
      // );
    }

    void _handleLogOut() {}

    return AdminHomePagePresentational(
      onLogOut: _handleLogOut,
      items: [
        ArticleTabItem.fromArticleStates(
            _eventStates, 'Event', _handleTapEvent),
        ArticleTabItem.fromArticleState(_sistoreState, _handleTapSistore),
        ArticleTabItem.fromArticleState(_beasiswaState),
        ArticleTabItem.fromArticleState(_prestasiState),
        ArticleTabItem.fromArticleState(_akademikState),
        ArticleTabItem.fromArticleStates(_karirStates, 'Karir'),
        ArticleTabItem.fromArticleStates(_lombaStates, 'Lomba'),
        ArticleTabItem.fromArticleState(_umumState),
      ],
    );
  }
}
