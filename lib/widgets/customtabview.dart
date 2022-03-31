import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himaskom_undip/widgets/articlelist.dart';

class ArticleTabItem {
  final String title;
  final String fetchUrl;

  const ArticleTabItem({
    required this.title,
    required this.fetchUrl,
  });
}

class CustomTabView extends HookWidget {
  final List<ArticleTabItem> items;

  const CustomTabView({Key? key, required this.items}) : super(key: key);

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
            tabs: items.map((e) => Tab(text: e.title)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: items
                .map(
                  (e) => ArticleList(
                    fetchUrl: e.fetchUrl,
                    firstHighlight: true,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
