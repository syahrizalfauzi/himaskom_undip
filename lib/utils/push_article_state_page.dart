import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/models/article_tab_item.dart';
import 'package:himaskom_undip/widgets/article_state_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future pushArticleStatePage({
  required BuildContext context,
  required ChangeNotifierProvider<ArticleState> state,
  required String title,
  required Widget Function(ArticleTabItem) builder,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) =>
          ArticleStateBuilder(states: [state], title: title, builder: builder),
    ),
  );
}

//TODO: buildernya list of articletabitem
Future pushArticleStatesPage({
  required BuildContext context,
  required List<ChangeNotifierProvider<ArticleState>> states,
  required String title,
  required Widget Function(ArticleTabItem) builder,
}) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) =>
          ArticleStateBuilder(states: states, title: title, builder: builder),
    ),
  );
}
