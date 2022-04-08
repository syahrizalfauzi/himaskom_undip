import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final prestasiArticleState =
    ChangeNotifierProvider((_) => PrestasiArticleState());

class PrestasiArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/prestasi";
  @override
  final String title = "Prestasi";
  @override
  List<Article> articles = [
    Article(
      id: 'prestasi1',
      judul: 'Mahasiswa Tekkom Menang Bitcoin',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.prestasi,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
