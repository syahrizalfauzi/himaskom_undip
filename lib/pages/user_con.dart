import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/article_detail_con.dart';
import 'package:himaskom_undip/pages/search_con.dart';
import 'package:himaskom_undip/pages/user_pres.dart';
import 'package:himaskom_undip/states/penyimpanan_article.dart';
import 'package:himaskom_undip/widgets/custom_snackbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserContainer extends StatefulHookConsumerWidget {
  const UserContainer({Key? key}) : super(key: key);

  @override
  ConsumerState<UserContainer> createState() => _PageState();
}

class _PageState extends ConsumerState<UserContainer> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final _currentPage = useState(Pages.beranda);
    final _user = useMemoized(() => FirebaseAuth.instance.currentUser!, []);
    final _penyimpananArticleState = ref.read(penyimpananArticleState);
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

    _handleTapItem(Pages page) {
      _currentPage.value = page;
      _advancedDrawerController.hideDrawer();
    }

    _handleTapArticle(Article article) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ArticleDetailPageContainer(article: article)));
    }

    _handleShareArticle(Article article) {}
    _handleSaveArticle(Article article) async {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      await _penyimpananArticleState.save(article: article, token: token);
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar('Berhasil menyimpan article "${article.judul}"'));
    }

    _handleDeleteArticle(Article article) async {}
    _handleTapLogOut() {
      FirebaseAuth.instance.signOut();
      //Unsub FCM & clear local storage
    }

    _handleTapSearch() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SearchPageContainer(
                onTapArticle: _handleTapArticle,
              )));
    }

    useEffect(() {
      _penyimpananArticleState.uid = FirebaseAuth.instance.currentUser!.uid;

      return;
    }, []);

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
      userEmail: _user.email!,
      userName: _user.displayName!,
    );
  }
}
