import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/admin_pres.dart';

class AdminContainer extends StatelessWidget {
  const AdminContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTapArticle(Article article) {}
    void _handleDeleteArticle(Article article) {}

    return AdminPresentational(
      onTapArticle: _handleTapArticle,
      onDeleteArticle: _handleDeleteArticle,
    );
  }
}
