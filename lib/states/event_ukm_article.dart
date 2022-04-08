import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventUkmArticleState =
    ChangeNotifierProvider((_) => EventUkmArticleState());

class EventUkmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/event/ukm";
  @override
  final String title = "UKM Tekkom";
  @override
  List<Article> articles = [
    Article(
      id: 'eventukm1',
      judul: 'Badminton di Graha Estetika 18.00 WIB',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: DateTime.now(),
      jenis: ArticleCategory.eventUkm,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
