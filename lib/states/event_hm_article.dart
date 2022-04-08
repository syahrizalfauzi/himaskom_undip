import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventHmArticleState =
    ChangeNotifierProvider((_) => EventHmArticleState());

class EventHmArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/event/hm";
  @override
  final String title = "HIMASKOM";
  @override
  List<Article> articles = [
    Article(
      id: 'eventhm1',
      judul: 'Rapat Kerja HIMASKOM 2022',
      gambarUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg'
      ],
      createdAt: DateTime.now(),
      tenggat: DateTime.now(),
      jenis: ArticleCategory.eventHm,
      harga: 0,
      deskripsi: "Halo ini deskripsi lorem ipsum dolor sit amet",
    )
  ];
}
