import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchArticleState = ChangeNotifierProvider((_) => SearchArticleState());

class SearchArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/search";

  Future<List<Article>> search(String keyword) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    notifyListeners();

    return [
      Article(
        id: "id-1",
        judul: keyword,
        gambarUrl: [
          'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
        ],
        createdAt: DateTime.now(),
        jenis: ArticleCategory.akademik,
        harga: 0,
      ),
    ];
  }
}
