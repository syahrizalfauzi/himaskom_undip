import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/articlestate.dart';
import 'package:himaskom_undip/widgets/articleshortitem.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleShortList extends HookConsumerWidget {
  final ProviderListenable<ArticleState> state;
  final bool isAdminVariant;

  const ArticleShortList({
    Key? key,
    required this.state,
    this.isAdminVariant = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _state = ref.watch(state);

    useEffect(() {
      if (_state.articles.isEmpty) {
        _state.fetch();
      }
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: _state.fetch,
      child: _state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _state.articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: index == 9 ? 16 : 0,
                  ),
                  child: ArticleShortItem(
                    article: _state.articles[index],
                    isAdminVariant: isAdminVariant,
                  ),
                );
              },
            ),
    );
  }
}
