import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
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

enum ArticleStateItemCategory {
  event,
  sistore,
  beasiswa,
  prestasi,
  akademik,
  karir,
  lomba,
  umum
}

ArticleStateItemCategory getCategoryFromState(ArticleState state) {
  if (state is AkademikArticleState) {
    return ArticleStateItemCategory.akademik;
  } else if (state is BeasiswaArticleState) {
    return ArticleStateItemCategory.beasiswa;
  } else if (state is EventAmArticleState ||
      state is EventHmArticleState ||
      state is EventUkmArticleState) {
    return ArticleStateItemCategory.event;
  } else if (state is KarirLokerArticleState ||
      state is KarirMagangArticleState) {
    return ArticleStateItemCategory.karir;
  } else if (state is LombaAkademikArticleState ||
      state is LombaNonakademikArticleState) {
    return ArticleStateItemCategory.lomba;
  } else if (state is PrestasiArticleState) {
    return ArticleStateItemCategory.prestasi;
  } else if (state is SistoreArticleState) {
    return ArticleStateItemCategory.sistore;
  } else {
    return ArticleStateItemCategory.umum;
  }
}

class ArticleStateItem {
  final List<Article> articles;
  final String title;
  final bool isLoading;
  final Future<void> Function() onRefresh;
  final void Function()? onTap;
  final ArticleStateItemCategory category;

  const ArticleStateItem({
    required this.articles,
    required this.title,
    required this.isLoading,
    required this.onRefresh,
    this.onTap,
    required this.category,
  });

  factory ArticleStateItem.fromArticleStates({
    required List<ArticleState> states,
    required String title,
    void Function()? onTap,
  }) {
    return ArticleStateItem(
      articles: states.map((e) => e.articles).reduce((a, b) => [...a, ...b]),
      title: title,
      isLoading: states.map((e) => e.isLoading).reduce((a, b) => a || b),
      category: getCategoryFromState(states[0]),
      onTap: onTap,
      onRefresh: () async {
        await Future.wait(states.map((e) => e.getAll()));
      },
    );
  }

  factory ArticleStateItem.fromArticleState({
    required ArticleState state,
    required Future<void> Function() onRefresh,
    void Function()? onTap,
  }) {
    return ArticleStateItem(
      articles: state.articles,
      title: state.title,
      isLoading: state.isLoading,
      category: getCategoryFromState(state),
      onTap: onTap,
      onRefresh: onRefresh,
    );
  }

  @override
  String toString() {
    return 'ArticleStateItem(articles: $articles, title: $title, isLoading: $isLoading, onRefresh: $onRefresh, onTap: $onTap, category: $category)';
  }
}
