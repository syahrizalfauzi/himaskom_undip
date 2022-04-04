import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/utils/getArticleCallback.dart';
import 'package:intl/intl.dart';

class ArticleListItem extends StatelessWidget {
  final Article article;
  final Function(Article) onTap;

  const ArticleListItem({
    Key? key,
    required this.article,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: getArticleCallback(onTap, article),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.judul,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        height: 1.56,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat('dd MMM y').format(article.createdAt!),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB4B3BA),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 86,
                  width: 86,
                  child:
                      Image.network(article.gambarUrl![0], fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
