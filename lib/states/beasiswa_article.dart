import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final beasiswaArticleState =
    ChangeNotifierProvider((_) => BeasiswaArticleState());

class BeasiswaArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/beasiswa";
  @override
  final String title = "Beasiswa";
}
