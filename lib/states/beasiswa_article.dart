import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final beasiswaArticleState =
    ChangeNotifierProvider((_) => BeasiswaArticleState());

class BeasiswaArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/beasiswa";
  @override
  final String title = "Beasiswa";
  @override
  List<Article> articles = [
    Article(
      id: 'beasiswa1',
      judul: 'BRILiaN Scholarship 2022',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.beasiswa,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
