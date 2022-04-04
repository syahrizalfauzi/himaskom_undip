import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final umumArticleState = ChangeNotifierProvider((_) => UmumArticleState());

class UmumArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/umum";
  @override
  final String title = "Umum";
}
