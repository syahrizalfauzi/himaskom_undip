import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/article_detail_con.dart';
import 'package:himaskom_undip/pages/search_con.dart';
import 'package:himaskom_undip/pages/user_pres.dart';

class UserContainer extends StatefulHookWidget {
  const UserContainer({Key? key}) : super(key: key);

  @override
  State<UserContainer> createState() => _PageState();
}

class _PageState extends State<UserContainer> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final _currentPage = useState(Pages.beranda);
    final _appBarTitle = useMemoized(() {
      switch (_currentPage.value) {
        case Pages.beranda:
          return "Beranda";
        case Pages.notifikasi:
          return "Notifikasi";
        case Pages.semuakategori:
          return "Semua Kategori";
        case Pages.penyimpanan:
          return "Penyimpanan";
        case Pages.profile:
          return "Profile";
        default:
          return "Beranda";
      }
    }, [_currentPage.value]);

    void _handleTapItem(Pages page) {
      _currentPage.value = page;
      _advancedDrawerController.hideDrawer();
    }

    void _handleTapArticle(Article article) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ArticleDetailPageContainer(article: article)));
    }

    void _handleShareArticle(Article article) {}
    void _handleSaveArticle(Article article) {}
    Future<void> _handleDeleteArticle(Article article) async {}
    void _handleTapLogOut() {}
    void _handleTapSearch() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SearchPageContainer(
                onTapArticle: _handleTapArticle,
              )));
    }

    return UserPresentational(
      drawerController: _advancedDrawerController,
      appBarTitle: _appBarTitle,
      currentPage: _currentPage.value,
      onChangePage: _handleTapItem,
      onTapLogOut: _handleTapLogOut,
      onTapSearch: _handleTapSearch,
      onDeleteArticle: _handleDeleteArticle,
      onSaveArticle: _handleSaveArticle,
      onShareArticle: _handleShareArticle,
      onTapArticle: _handleTapArticle,
      userEmail: 'syahrizal@email.com',
      userName: 'Syahrizal Fauzi',
    );
  }
}
