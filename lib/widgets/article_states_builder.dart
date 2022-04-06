import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleStatesBuilder extends HookConsumerWidget {
  final List<ChangeNotifierProvider<ArticleState>> states;
  final Widget Function(List<ArticleState>) builder;

  const ArticleStatesBuilder({
    Key? key,
    required this.states,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = states.map((e) => ref.watch(e));

    return builder(_articleState.toList());
  }
}
