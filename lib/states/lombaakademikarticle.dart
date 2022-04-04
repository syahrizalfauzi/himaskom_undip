import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lombaAkademikArticleState =
    ChangeNotifierProvider((_) => LombaAkademikArticleState());

class LombaAkademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/lomba/akademik";
}
