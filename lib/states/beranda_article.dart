import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final berandaArticleState =
    ChangeNotifierProvider((_) => BerandaArticleState());

class BerandaArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles";
  @override
  final String title = "Rekomendasi";
}
