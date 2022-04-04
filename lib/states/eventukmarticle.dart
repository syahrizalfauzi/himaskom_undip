import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventUkmArticleState =
    ChangeNotifierProvider((_) => EventUkmArticleState());

class EventUkmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/event/ukm";
  @override
  final String title = "UKM Tekkom";
}
