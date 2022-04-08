import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lombaAkademikArticleState =
    ChangeNotifierProvider((_) => LombaAkademikArticleState());

class LombaAkademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/lomba/akademik";
  @override
  final String title = "Akademik";
  @override
  List<Article> articles = [
    Article(
      id: 'lombakaademik1',
      judul: 'Lomba TOEFL Internasional',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.lombaAkademik,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
