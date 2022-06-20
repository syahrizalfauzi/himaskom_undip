import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/article_detail_con.dart';
import 'package:himaskom_undip/pages/notifikasi_pres.dart';
import 'package:himaskom_undip/pages/notifikasi_settings_con.dart';
import 'package:himaskom_undip/providers/article_states.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifikasiPageContainer extends HookConsumerWidget {
  const NotifikasiPageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(notifikasiArticleState);

    _handleTapSettings() async {
      final result = await showDialog(
        context: context,
        builder: (context) => const NotifikasiSettingsContainer(),
      );

      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackbar("Berhasil menyimpan pengaturan notifikasi"));
      }
    }

    _handleDeleteArticle(Article article) async {
      await _articleState.delete(article: article);
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackbar("Artikel berhasil dihapus"));
    }

    _handleTapArticle(Article article) async {
      final result = await Navigator.of(context).push<bool?>(MaterialPageRoute(
          builder: (_) => ArticleDetailPageContainer(article: article)));

      if (result != null && result == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(CustomSnackbar("Artikel sudah dihapus"));
        await _articleState.delete(article: article);
      }
    }

    useEffect(() {
      _articleState.getAll(false);
      return;
    }, []);

    return NotifikasiPagePresentational(
      articles: _articleState.articles,
      onRefresh: _articleState.getAll,
      isLoading: _articleState.isLoading,
      settingsSubtitle: _articleState.enabledPrefs,
      onTapArticle: _handleTapArticle,
      onDeleteArticle: _handleDeleteArticle,
      onTapSettings: _handleTapSettings,
    );
  }
}
