import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lombaAkademikArticleState =
    ChangeNotifierProvider((_) => LombaAkademikArticleState());

class LombaAkademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/lomba_akademik";
  @override
  final String title = "Akademik";
}
