import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifikasiArticleState =
    ChangeNotifierProvider((_) => NotifikasiArticleState());

class NotifikasiArticleState extends ArticleState {
  @override
  final String title = "Penyimpanan";
  @override
  final String fetchUrl = "articles/saved/";
}
