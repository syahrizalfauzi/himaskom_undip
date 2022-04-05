import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/notifikasi_pres.dart';
import 'package:himaskom_undip/pages/notifikasi_settings_con.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifikasiPageContainer extends HookConsumerWidget {
  const NotifikasiPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(notifikasiArticleState);
    final _settingsSubstitle = useState("Semua Kategori");

    void _handleTapArticle(Article article) => debugPrint(article.toString());
    Future<void> _handleTapSettings() async {
      final Map<String, bool>? result = await showDialog(
        context: context,
        builder: (context) => const NotifikasiSettingsContainer(),
      );
      debugPrint(result.toString());
    }

    return NotifikasiPagePresentational(
      articles: _articleState.articles,
      onRefresh: _articleState.getAll,
      isLoading: _articleState.isLoading,
      settingsSubtitle: _settingsSubstitle.value,
      onTapArticle: _handleTapArticle,
      onDeleteArticle: _handleTapArticle,
      onTapSettings: _handleTapSettings,
    );
  }
}
