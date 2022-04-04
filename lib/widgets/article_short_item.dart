import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/utils/get_article_callback.dart';

class ArticleShortItem extends StatelessWidget {
  final Article article;
  final Function(Article) onTap;
  final Function(Article) onDelete;
  final bool isAdminVariant;

  const ArticleShortItem({
    Key? key,
    required this.article,
    required this.onTap,
    required this.onDelete,
    required this.isAdminVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isAdminVariant) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.15,
            children: [
              SlidableAction(
                onPressed: (_) => onDelete(article),
                backgroundColor: const Color(0xFFFE7575),
                foregroundColor: Colors.white,
                icon: Icons.delete_outline,
                spacing: 4,
                flex: 1,
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xFFECECEE),
                ),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
              ),
              child: InkWell(
                onTap: getArticleCallback(onTap, article),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    article.judul,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Card(
      elevation: 10,
      shadowColor: const Color(0x328D92AB),
      child: InkWell(
        onTap: getArticleCallback(onTap, article),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 56,
                  width: 56,
                  child: Image.network(
                    article.gambarUrl![0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  article.judul,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
