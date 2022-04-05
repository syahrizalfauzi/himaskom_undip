import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventHmArticleState =
    ChangeNotifierProvider((_) => EventHmArticleState());

class EventHmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/event/hm";
  @override
  final String title = "HIMASKOM";
}