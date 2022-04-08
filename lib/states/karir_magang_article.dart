import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final karirMagangArticleState =
    ChangeNotifierProvider((_) => KarirMagangArticleState());

class KarirMagangArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/karir/magang";
  @override
  final String title = "Magang";
  @override
  List<Article> articles = [
    Article(
      id: 'karirmagang1',
      judul: 'Oprec Magang Google',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.karirMagang,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
