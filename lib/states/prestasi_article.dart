import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final prestasiArticleState =
    ChangeNotifierProvider((_) => PrestasiArticleState());

class PrestasiArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/prestasi";
  @override
  final String title = "Prestasi";
}
