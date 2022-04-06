import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/widgets/article_states_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future pushArticleStatesPage({
  required BuildContext context,
  required List<ChangeNotifierProvider<ArticleState>> states,
  required Widget Function(List<ArticleState>) builder,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => ArticleStatesBuilder(states: states, builder: builder),
    ),
  );
}
