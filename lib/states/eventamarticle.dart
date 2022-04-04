import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventAmArticleState =
    ChangeNotifierProvider((_) => EventAmArticleState());

class EventAmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/event/am";
  @override
  final String title = "Al-Muharrik";
}
