import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/notifikasi_pres.dart';
import 'package:himaskom_undip/pages/notifikasi_settings_con.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifikasiPageContainer extends HookConsumerWidget {
  final Function(Article) onTapArticle;

  const NotifikasiPageContainer({
    Key? key,
    required this.onTapArticle,
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
      onTapArticle: onTapArticle,
      onDeleteArticle: _handleDeleteArticle,
      onTapSettings: _handleTapSettings,
    );
  }
}
