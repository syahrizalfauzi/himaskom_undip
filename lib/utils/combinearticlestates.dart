import 'package:himaskom_undip/models/articlestate.dart';
import 'package:himaskom_undip/widgets/customtabview.dart';

ArticleTabItem combineArticleStates(List<ArticleState> states, String title) =>
    ArticleTabItem(
      articles: states.map((e) => e.articles).reduce((a, b) => [...a, ...b]),
      title: title,
      isLoading: states.map((e) => e.isLoading).reduce((a, b) => a || b),
      onRefresh: () async {
        await Future.wait(states.map((e) => e.fetch()));
      },
    );
