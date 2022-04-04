import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lombaNonakademikArticleState =
    ChangeNotifierProvider((_) => LombaNonakademikArticleState());

class LombaNonakademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/lomba/nonakademik";
}
