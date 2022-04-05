import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:himaskom_undip/pages/beranda_con.dart';
import 'package:himaskom_undip/pages/kategori_con.dart';
import 'package:himaskom_undip/pages/notifikasi_con.dart';
import 'package:himaskom_undip/pages/penyimpanan_con.dart';
import 'package:himaskom_undip/pages/profile_con.dart';
import 'package:himaskom_undip/widgets/drawer_item.dart';

enum Pages { beranda, notifikasi, semuakategori, penyimpanan, profile }

class UserPresentational extends StatelessWidget {
  final AdvancedDrawerController drawerController;
  final String appBarTitle;
  final Pages currentPage;
  final void Function(Pages) onChangePage;
  final void Function() onTapLogOut;
  final void Function() onTapSearch;

  const UserPresentational({
    Key? key,
    required this.drawerController,
    required this.appBarTitle,
    required this.currentPage,
    required this.onChangePage,
    required this.onTapLogOut,
    required this.onTapSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: const Color(0xFFF9F8FD),
      controller: drawerController,
      animationCurve: Curves.easeInOutExpo,
      animationDuration: const Duration(milliseconds: 250),
      openRatio: 0.5,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0x45CFCCCD),
            blurRadius: 41,
            offset: Offset(0, 9),
          )
        ]),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              appBarTitle,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: drawerController.showDrawer,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: drawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            actions: [
              IconButton(
                onPressed: onTapSearch,
                icon: const Icon(Icons.search),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: (() {
            switch (currentPage) {
              case Pages.beranda:
                return const BerandaPageContainer();
              case Pages.notifikasi:
                return const NotifikasiPageContainer();
              case Pages.semuakategori:
                return KategoriPageContainer(onTapSearch: onTapSearch);
              case Pages.penyimpanan:
                return const PenyimpananPageContainer();
              case Pages.profile:
                return const ProfilePageContainer();
            }
          })(),
        ),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 72),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hari yang baik,',
                        style: TextStyle(
                          color: Color(0xFFB4B3BA),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Syahrizal Fauzi',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '21120118130066',
                        style: TextStyle(
                          color: Color(0xFFB4B3BA),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                DrawerItem(
                  title: 'Beranda',
                  onTap: () => onChangePage(Pages.beranda),
                  isSelected: currentPage == Pages.beranda,
                ),
                DrawerItem(
                  title: 'Notifikasi',
                  onTap: () => onChangePage(Pages.notifikasi),
                  isSelected: currentPage == Pages.notifikasi,
                ),
                DrawerItem(
                  title: 'Semua Kategori',
                  onTap: () => onChangePage(Pages.semuakategori),
                  isSelected: currentPage == Pages.semuakategori,
                ),
                DrawerItem(
                  title: 'Penyimpanan',
                  onTap: () => onChangePage(Pages.penyimpanan),
                  isSelected: currentPage == Pages.penyimpanan,
                ),
                DrawerItem(
                  title: 'Profile',
                  onTap: () => onChangePage(Pages.profile),
                  isSelected: currentPage == Pages.profile,
                ),
                const Spacer(),
                ListTile(
                  onTap: onTapLogOut,
                  title: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
