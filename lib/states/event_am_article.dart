import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventAmArticleState =
    ChangeNotifierProvider((_) => EventAmArticleState());

class EventAmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/event/am";
  @override
  final String title = "Al-Muharrik";
  @override
  List<Article> articles = [
    Article(
      id: 'eventam1',
      judul: 'Pengajian',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: DateTime.now(),
      jenis: ArticleCategory.eventAm,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
