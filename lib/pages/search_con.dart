import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/search_pres.dart';
import 'package:himaskom_undip/states/search_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPageContainer extends HookConsumerWidget {
  final void Function(Article) onTapArticle;

  const SearchPageContainer({
    Key? key,
    required this.onTapArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(searchArticleState);
    final _articles = useState<List<Article>>([]);
    final _controller = useTextEditingController();

    _handleSubmit(String value) async {
      if (value.isEmpty) return;
      _articles.value = await _articleState.search(value);
    }

    _handleClear() => _controller.clear();
    _handleBack() => Navigator.of(context).pop();

    return SearchPagePresentational(
      articles: _articles.value,
      isLoading: _articleState.isLoading,
      onTapArticle: onTapArticle,
      onSubmit: _handleSubmit,
      controller: _controller,
      onClear: _handleClear,
      onBack: _handleBack,
    );
  }
}
