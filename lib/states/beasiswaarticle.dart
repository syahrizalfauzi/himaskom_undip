import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final beasiswaArticleState =
    ChangeNotifierProvider((_) => BeasiswaArticleState());

class BeasiswaArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/beasiswa";
}
