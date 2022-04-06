import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
// import 'package:himaskom_undip/states/akademik_article.dart';
// import 'package:himaskom_undip/states/beasiswa_article.dart';
// import 'package:himaskom_undip/states/event_am_article.dart';
// import 'package:himaskom_undip/states/event_hm_article.dart';
// import 'package:himaskom_undip/states/event_ukm_article.dart';
// import 'package:himaskom_undip/states/karir_loker_article.dart';
// import 'package:himaskom_undip/states/karir_magang_article.dart';
// import 'package:himaskom_undip/states/lomba_akademik_article.dart';
// import 'package:himaskom_undip/states/lomba_nonakademik_article.dart';
// import 'package:himaskom_undip/states/prestasi_article.dart';
// import 'package:himaskom_undip/states/sistore_article.dart';

// enum ArticleTabItemCategory {
//   event,
//   sistore,
//   beasiswa,
//   prestasi,
//   akademik,
//   karir,
//   lomba,
//   umum
// }

// ArticleTabItemCategory getCategoryFromState(ArticleState state) {
//   if (state is AkademikArticleState) {
//     return ArticleTabItemCategory.akademik;
//   } else if (state is BeasiswaArticleState) {
//     return ArticleTabItemCategory.beasiswa;
//   } else if (state is EventAmArticleState ||
//       state is EventHmArticleState ||
//       state is EventUkmArticleState) {
//     return ArticleTabItemCategory.event;
//   } else if (state is KarirLokerArticleState ||
//       state is KarirMagangArticleState) {
//     return ArticleTabItemCategory.karir;
//   } else if (state is LombaAkademikArticleState ||
//       state is LombaNonakademikArticleState) {
//     return ArticleTabItemCategory.lomba;
//   } else if (state is PrestasiArticleState) {
//     return ArticleTabItemCategory.prestasi;
//   } else if (state is SistoreArticleState) {
//     return ArticleTabItemCategory.sistore;
//   } else {
//     return ArticleTabItemCategory.umum;
//   }
// }

class ArticleTabItem {
  final List<Article> articles;
  final String title;
  final bool isLoading;
  final Future<void> Function() onRefresh;
  final void Function()? onTap;
  // final ArticleTabItemCategory category;

  const ArticleTabItem({
    required this.articles,
    required this.title,
    required this.isLoading,
    required this.onRefresh,
    this.onTap,
    // required this.category,
  });

  factory ArticleTabItem.fromArticleStates(
      List<ArticleState> states, String title,
      [void Function()? onTap]) {
    return ArticleTabItem(
      articles: states.map((e) => e.articles).reduce((a, b) => [...a, ...b]),
      title: title,
      isLoading: states.map((e) => e.isLoading).reduce((a, b) => a || b),
      // category: getCategoryFromState(states[0]),
      onTap: onTap,
      onRefresh: () async {
        await Future.wait(states.map((e) => e.getAll()));
      },
    );
  }

  factory ArticleTabItem.fromArticleState(ArticleState state,
      [void Function()? onTap]) {
    return ArticleTabItem(
      articles: state.articles,
      title: state.title,
      isLoading: state.isLoading,
      // category: getCategoryFromState(state),
      onTap: onTap,
      onRefresh: state.getAll,
    );
  }
}
