import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_short_list.dart';

class NotifikasiPagePresentational extends StatelessWidget {
  final List<Article> articles;
  final String settingsSubtitle;
  final Future<void> Function() onRefresh;
  final Function(Article) onTapArticle;
  final Function(Article) onDeleteArticle;
  final void Function() onTapSettings;
  final bool isLoading;

  const NotifikasiPagePresentational({
    Key? key,
    required this.articles,
    required this.settingsSubtitle,
    required this.onRefresh,
    required this.onTapArticle,
    required this.onDeleteArticle,
    required this.onTapSettings,
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
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pengaturan Notifikasi",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      settingsSubtitle,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTapSettings,
                icon: const Icon(Icons.more_horiz),
              )
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
