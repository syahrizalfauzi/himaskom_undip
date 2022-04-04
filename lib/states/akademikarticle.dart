import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final akademikArticleState =
    ChangeNotifierProvider((_) => AkademikArticleState());

class AkademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/akademik";
  @override
  final String title = "Akademik";
}
