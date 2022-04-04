import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sistoreArticleState =
    ChangeNotifierProvider((_) => SistoreArticleState());

class SistoreArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/sistore";
  @override
  final String title = "Sistore";
}
