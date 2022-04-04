import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/articlestate.dart';
import 'package:himaskom_undip/widgets/itemcard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemGrid extends HookConsumerWidget {
  final ProviderListenable<ArticleState> state;

  const ItemGrid({
    Key? key,
    required this.state,
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
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: _state.articles.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  article: _state.articles[index],
                );
              },
            ),
    );
  }
}
