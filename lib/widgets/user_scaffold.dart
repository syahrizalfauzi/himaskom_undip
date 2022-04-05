import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/profile_con.dart';
import 'package:himaskom_undip/widgets/drawer_item.dart';

enum Pages { beranda, notifikasi, semuakategori, penyimpanan, profil }

const pageTitle = {
  'beranda': "Beranda",
  'notifikasi': "Notifikasi",
  'semuakategori': "Semua Kategori",
  'penyimpanan': "Penyimpanan",
  'profil': "Profil"
};

class UserScaffold extends StatefulHookWidget {
  const UserScaffold({Key? key}) : super(key: key);

  @override
  State<UserScaffold> createState() => _PageState();
}

class _PageState extends State<UserScaffold> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final _currentPage = useState(Pages.beranda);

    void _handleItemTap(Pages page) {
      _currentPage.value = page;
      _advancedDrawerController.hideDrawer();
    }

    return AdvancedDrawer(
      backdropColor: const Color(0xFFF9F8FD),
      controller: _advancedDrawerController,
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
            title: Text(
              pageTitle[_currentPage.value.name]!,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => _advancedDrawerController.showDrawer(),
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
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
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: const AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: ProfilePageContainer(),
          ),
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
                  page: Pages.beranda,
                  onTap: _handleItemTap,
                  isSelected: _currentPage.value == Pages.beranda,
                ),
                DrawerItem(
                  page: Pages.notifikasi,
                  onTap: _handleItemTap,
                  isSelected: _currentPage.value == Pages.notifikasi,
                ),
                DrawerItem(
                  page: Pages.semuakategori,
                  onTap: _handleItemTap,
                  isSelected: _currentPage.value == Pages.semuakategori,
                ),
                DrawerItem(
                  page: Pages.penyimpanan,
                  onTap: _handleItemTap,
                  isSelected: _currentPage.value == Pages.penyimpanan,
                ),
                DrawerItem(
                  page: Pages.profil,
                  onTap: _handleItemTap,
                  isSelected: _currentPage.value == Pages.profil,
                ),
                const Spacer(),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Log out',
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
