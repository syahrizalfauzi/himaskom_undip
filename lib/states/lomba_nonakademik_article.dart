import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lombaNonakademikArticleState =
    ChangeNotifierProvider((_) => LombaNonakademikArticleState());

class LombaNonakademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/lomba/nonakademik";
  @override
  final String title = "Non-akademik";
}
