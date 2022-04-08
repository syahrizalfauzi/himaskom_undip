import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final umumArticleState = ChangeNotifierProvider((_) => UmumArticleState());

class UmumArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/umum";
  @override
  final String title = "Umum";
  @override
  List<Article> articles = [
    Article(
      id: 'umum1',
      judul: 'Road Work Ahead',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: null,
      jenis: ArticleCategory.umum,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
