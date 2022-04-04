import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_short_list.dart';

class NotifikasiPagePresentational extends StatelessWidget {
  final List<Article> articles;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapArticle;
  final Function(Article) onDeleteArticle;
  final bool isLoading;

  const NotifikasiPagePresentational({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTapArticle,
    required this.onDeleteArticle,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan Notifikasi",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Semua Kategori",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ],
          ),
        ),
        Expanded(
          child: ArticleShortList(
            isAdminVariant: false,
            articles: articles,
            onRefresh: onRefresh,
            isLoading: isLoading,
            onTapArticle: onTapArticle,
            onDeleteArticle: onDeleteArticle,
          ),
        ),
      ],
    );
  }
}
