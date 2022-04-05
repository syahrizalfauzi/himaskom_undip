import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/beranda_con.dart';
import 'package:himaskom_undip/pages/kategori_con.dart';
import 'package:himaskom_undip/pages/notifikasi_con.dart';
import 'package:himaskom_undip/pages/penyimpanan_con.dart';
import 'package:himaskom_undip/pages/profile_con.dart';
import 'package:himaskom_undip/pages/user_pres.dart';
import 'package:himaskom_undip/widgets/drawer_item.dart';

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
    }, [_currentPage]);

    void _handleTapItem(Pages page) {
      _currentPage.value = page;
      _advancedDrawerController.hideDrawer();
    }

    void _handleTap() {}

    return UserPresentational(
      drawerController: _advancedDrawerController,
      appBarTitle: _appBarTitle,
      currentPage: _currentPage.value,
      onChangePage: _handleTapItem,
      onTapLogOut: _handleTap,
      onTapSearch: _handleTap,
    );
  }
}
