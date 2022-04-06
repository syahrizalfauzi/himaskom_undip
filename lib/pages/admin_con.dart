import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/admin_pres.dart';

class AdminPageContainer extends StatelessWidget {
  const AdminPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTapArticle(Article article) {}

    return AdminPagePresentational(onTapArticle: _handleTapArticle);
  }
}
