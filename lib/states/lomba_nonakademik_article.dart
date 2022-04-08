import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final lombaNonakademikArticleState =
    ChangeNotifierProvider((_) => LombaNonakademikArticleState());

class LombaNonakademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/lomba/nonakademik";
  @override
  final String title = "Non-Akademik";
  @override
  List<Article> articles = [
    Article(
      id: 'lombanonakademik1',
      judul: 'Balapan Motor Nasional',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.lombaNonakademik,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
