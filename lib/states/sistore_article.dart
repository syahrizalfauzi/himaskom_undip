import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sistoreArticleState =
    ChangeNotifierProvider((_) => SistoreArticleState());

class SistoreArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/sistore";
  @override
  final String title = "Sistore";
  @override
  List<Article> articles = [
    Article(
      id: 'sistore1',
      judul: 'Merch Tekkom Batch 1',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.sistore,
      harga: 100000,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
