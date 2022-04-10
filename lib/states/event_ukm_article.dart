import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventUkmArticleState =
    ChangeNotifierProvider((_) => EventUkmArticleState());

class EventUkmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/event_ukm";
  @override
  final String title = "UKM Tekkom";
}
