import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final karirMagangArticleState =
    ChangeNotifierProvider((_) => KarirMagangArticleState());

class KarirMagangArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/jenis/karir_magang";
  @override
  final String title = "Magang";
}
