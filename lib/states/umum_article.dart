import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final umumArticleState = ChangeNotifierProvider((_) => UmumArticleState());

class UmumArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/umum";
  @override
  final String title = "Umum";
}
