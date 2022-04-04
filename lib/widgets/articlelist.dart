import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/articlestate.dart';
import 'package:himaskom_undip/widgets/articlecard.dart';
import 'package:himaskom_undip/widgets/articlelistitem.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleList extends HookConsumerWidget {
  final List<ProviderListenable<ArticleState>> state;
  final bool firstHighlight;

  const ArticleList({
    Key? key,
    required this.state,
    this.firstHighlight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _state = state.map((e) => ref.watch(e));
    final _articles = useMemoized(
        () => _state.map((e) => e.articles).reduce((a, b) => [...a, ...b]),
        [_state]);
    final _isLoading = useMemoized(
        () => _state.map((e) => e.isLoading).reduce((a, b) => a || b),
        [_state]);

    Future<void> _fetch() async {
      await Future.wait(_state.map((e) => e.fetch()));
    }

    useEffect(() {
      if (_articles.isEmpty) {
        _fetch();
      }
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: _fetch,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                Widget child;
                if (index == 0 && firstHighlight) {
                  child = Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ArticleCard(article: _articles[index]),
                      const SizedBox(height: 32),
                      const Text(
                        'Info Terbaru',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  );
                } else {
                  child = ArticleListItem(
                    article: _articles[index],
                  );
                }

                return Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: index == 9 ? 16 : 0,
                  ),
                  child: child,
                );
              },
            ),
    );
  }
}
