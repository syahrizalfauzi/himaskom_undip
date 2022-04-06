import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state_item.dart';
import 'package:himaskom_undip/widgets/article_list.dart';

class ArticleTabView extends HookWidget {
  final List<ArticleStateItem> items;
  final Function(Article) onTapArticle;
  final Function(Article) onSaveArticle;
  final Function(Article) onShareArticle;

  const ArticleTabView({
    Key? key,
    required this.items,
    required this.onTapArticle,
    required this.onSaveArticle,
    required this.onShareArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabController = useTabController(initialLength: items.length);

    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: const Color(0xFF4F4E62),
            labelStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
            ),
            // isScrollable: true,
            tabs: items.map((e) => Tab(text: e.title)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: items
                .map(
                  (e) => ArticleList(
                    articles: e.articles,
                    firstHighlight: true,
                    isLoading: e.isLoading,
                    onRefresh: e.onRefresh,
                    onSaveArticle: onSaveArticle,
                    onShareArticle: onShareArticle,
                    onTapArticle: onTapArticle,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
