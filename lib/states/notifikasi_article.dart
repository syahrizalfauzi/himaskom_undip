import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notifikasiArticleState =
    ChangeNotifierProvider((_) => NotifikasiArticleState());

class NotifikasiArticleState extends ArticleState {
  @override
  final String title = "Notifikasi";

  @override
  Future<void> getAll() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    articles = sampleArticles;
    isLoading = false;
    notifyListeners();
  }
}
