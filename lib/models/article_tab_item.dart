import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';

class ArticleTabItem {
  final List<Article> articles;
  final String title;
  final bool isLoading;
  final Future<void> Function() onRefresh;
  final void Function()? onTap;

  const ArticleTabItem(
      {required this.articles,
      required this.title,
      required this.isLoading,
      required this.onRefresh,
      this.onTap});

  factory ArticleTabItem.fromArticleStates(
      List<ArticleState> states, String title,
      [void Function()? onTap]) {
    return ArticleTabItem(
      articles: states.map((e) => e.articles).reduce((a, b) => [...a, ...b]),
      title: title,
      isLoading: states.map((e) => e.isLoading).reduce((a, b) => a || b),
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
      onTap: onTap,
      onRefresh: state.getAll,
    );
  }
}
