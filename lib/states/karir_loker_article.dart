import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final karirLokerArticleState =
    ChangeNotifierProvider((_) => KarirLokerArticleState());

class KarirLokerArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/karir/loker";
  @override
  final String title = "Lowongan Kerja";
}
