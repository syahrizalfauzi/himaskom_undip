import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final akademikArticleState =
    ChangeNotifierProvider((_) => AkademikArticleState());

class AkademikArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/akademik";
  @override
  final String title = "Akademik";

  @override
  List<Article> articles = [
    Article(
      id: 'akademik1',
      judul: 'Besok UTS',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.akademik,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
