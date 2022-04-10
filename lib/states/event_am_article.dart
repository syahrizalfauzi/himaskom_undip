import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventAmArticleState =
    ChangeNotifierProvider((_) => EventAmArticleState());

class EventAmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/event_am";
  @override
  final String title = "Al-Muharrik";
}
