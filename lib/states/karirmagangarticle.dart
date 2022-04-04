import 'package:himaskom_undip/models/articlestate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final karirMagangArticleState =
    ChangeNotifierProvider((_) => KarirMagangArticleState());

class KarirMagangArticleState extends ArticleState {
  @override
  final String fetchUrl = "articles/karir/magang";
}
