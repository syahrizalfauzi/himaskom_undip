import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/beranda_pres.dart';
import 'package:himaskom_undip/states/beranda_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BerandaPageContainer extends HookConsumerWidget {
  final Function(Article) onTapArticle;
  final Function(Article) onSaveArticle;
  final Function(Article) onShareArticle;

  const BerandaPageContainer({
    Key? key,
    required this.onTapArticle,
    required this.onSaveArticle,
    required this.onShareArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(berandaArticleState);

    useEffect(() {
      _articleState.getAll(false);
      return;
    }, []);

    return BerandaPagePresentational(
      onSaveArticle: onSaveArticle,
      onShareArticle: onShareArticle,
      onTapArticle: onTapArticle,
      articles: _articleState.articles,
      isLoading: _articleState.isLoading,
      onRefresh: _articleState.getAll,
    );
  }
}
