import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/search_pres.dart';
import 'package:himaskom_undip/states/search_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPageContainer extends HookConsumerWidget {
  const SearchPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(searchArticleState);
    final _controller = useTextEditingController();

    Future<void> _handleSubmit(String value) async {
      if (value.isEmpty) return;
      await _articleState.search(value);
    }

    void _handleClear() => _controller.clear();

    return SearchPagePresentational(
      articles: _articleState.articles,
      isLoading: _articleState.isLoading,
      onTapArticle: (a) {},
      onSubmit: _handleSubmit,
      controller: _controller,
      onClear: _handleClear,
    );
  }
}
