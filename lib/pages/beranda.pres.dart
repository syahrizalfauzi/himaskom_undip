import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/customtabview.dart';

class BerandaPagePresentational extends StatelessWidget {
  final Function(Article) onTapArticle;
  final Function(Article) onSaveArticle;
  final Function(Article) onShareArticle;
  final List<ArticleTabItem> articleTabItems;

  const BerandaPagePresentational({
    Key? key,
    required this.onTapArticle,
    required this.onSaveArticle,
    required this.onShareArticle,
    required this.articleTabItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTabView(
      onSaveArticle: onSaveArticle,
      onShareArticle: onShareArticle,
      onTapArticle: onTapArticle,
      items: articleTabItems,
    );
  }
}
