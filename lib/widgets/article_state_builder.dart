import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/models/article_tab_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleStateBuilder extends HookConsumerWidget {
  final List<ChangeNotifierProvider<ArticleState>> states;
  final Widget Function(ArticleTabItem) builder;
  final String title;

  const ArticleStateBuilder({
    Key? key,
    required this.states,
    required this.builder,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = states.map((e) => ref.watch(e));

    return builder(
      ArticleTabItem.fromArticleStates(
        _articleState.toList(),
        title,
      ),
    );
  }
}
