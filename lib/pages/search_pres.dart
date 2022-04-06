import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/article_list.dart';
import 'package:himaskom_undip/widgets/custom_text_form_field.dart';

class SearchPagePresentational extends StatelessWidget {
  final List<Article> articles;
  final bool isLoading;
  final void Function(Article) onTapArticle;
  final void Function(String) onSubmit;
  final void Function() onClear;
  final void Function() onBack;
  final TextEditingController controller;

  const SearchPagePresentational({
    Key? key,
    required this.articles,
    required this.isLoading,
    required this.onTapArticle,
    required this.onSubmit,
    required this.onClear,
    required this.onBack,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: CustomTextFormField(
          hintText: "Cari informasi yang kamu mau...",
          onSubmit: onSubmit,
          controller: controller,
          dense: true,
        ),
        actions: [
          IconButton(
            onPressed: onClear,
            icon: const Icon(Icons.close),
            color: Colors.black,
          )
        ],
      ),
      body: ArticleList(
        articles: articles,
        isLoading: isLoading,
        onTapArticle: onTapArticle,
      ),
    );
  }
}
