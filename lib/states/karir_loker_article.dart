import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final karirLokerArticleState =
    ChangeNotifierProvider((_) => KarirLokerArticleState());

class KarirLokerArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/karir/loker";
  @override
  final String title = "Lowongan Kerja";
  @override
  List<Article> articles = [
    Article(
      id: 'karirloker1',
      judul: 'Lowongan Kerja Tokopedia',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.karirLoker,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
