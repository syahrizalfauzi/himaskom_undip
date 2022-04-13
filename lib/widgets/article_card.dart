import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/utils/get_article_callback.dart';
import 'package:himaskom_undip/widgets/article_jenis_icon.dart';
import 'package:intl/intl.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final Function(Article) onTap;
  final Function(Article) onSave;
  final Function(Article) onShare;
  const ArticleCard({
    Key? key,
    required this.article,
    required this.onTap,
    required this.onSave,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: const Color(0x328D92AB),
      child: InkWell(
        onTap: getArticleCallback(onTap, article),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AspectRatio(
                  aspectRatio: 2,
                  child:
                      Image.network(article.gambarUrl![0], fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                article.judul,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('dd MMM y').format(article.createdAt!),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB4B3BA),
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: getArticleCallback(onSave, article),
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints.tightFor(
                          height: 27,
                          width: 27,
                        ),
                        icon: Icon(
                          article.isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: getArticleCallback(onShare, article),
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints.tightFor(
                          height: 27,
                          width: 27,
                        ),
                        icon: Icon(
                          Icons.ios_share,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ArticleJenisIcon(jenis: article.jenis),
                  const SizedBox(width: 6),
                  Text(
                    article.jenisString,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
