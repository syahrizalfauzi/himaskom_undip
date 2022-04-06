import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/admin_home_con.dart';
import 'package:himaskom_undip/widgets/admin_scaffold.dart';

class AdminPresentational extends StatelessWidget {
  final Function(Article) onTapArticle;
  final Function(Article) onDeleteArticle;

  const AdminPresentational({
    Key? key,
    required this.onTapArticle,
    required this.onDeleteArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      title: 'Home',
      child: AdminHomePageContainer(
        onTapArticle: onTapArticle,
        onDeleteArticle: onDeleteArticle,
      ),
    );
  }
}
