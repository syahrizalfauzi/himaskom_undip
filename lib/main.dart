import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himaskom_undip/pages/user_con.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'HIMASKOM UNDIP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF171936),
            primary: const Color(0xFF171936),
          ),
          primaryColor: const Color(0xFF171936),
          disabledColor: const Color(0xFFB4B3BA),
          textTheme: GoogleFonts.interTextTheme(
            const TextTheme(
              headlineLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
              headlineMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
              labelMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 1.4,
              ),
              labelSmall: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 0,
              ),
              bodyLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              bodyMedium: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
        home: const UserContainer(),
        // home: const Scaffold(body: NotifikasiPageContainer()),
      ),
    );
  }
}

// class Page extends StatefulHookWidget {
//   const Page({Key? key}) : super(key: key);

//   @override
//   State<Page> createState() => _PageState();
// }

// class _PageState extends State<Page> {
//   @override
//   Widget build(BuildContext context) {
//     final eventTag = useState(0);
//     final karirTag = useState(1);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title'),
//         elevation: 0,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Flexible(
//             child: TagPicker(
//               tags: const [
//                 Tag(name: "hm", title: "HM"),
//                 Tag(name: "am", title: "AM"),
//                 Tag(name: "ukm", title: "UKM"),
//               ],
//               selectedIndex: eventTag.value,
//               onTap: (_, index) => eventTag.value = index,
//             ),
//           ),
//           Flexible(
//             child: TagPicker(
//               tags: const [
//                 Tag(name: "loker", title: "Loker"),
//                 Tag(name: "magang", title: "Magang"),
//               ],
//               selectedIndex: karirTag.value,
//               onTap: (_, index) => karirTag.value = index,
//             ),
//           ),
//         ],
//       ),
//     );
//     // Padding(
//     //   padding: const EdgeInsets.all(24),
//     //   child: Form(
//     //     key: _formKey,
//     //     child: ListView.separated(
//     //       itemCount: 10,
//     //       separatorBuilder: (context, index) {
//     //         return const SizedBox(height: 12);
//     //       },
//     //       itemBuilder: (context, index) {
//     //         return ArticleShortItem(
//     //           judul:
//     //               '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
//     //           id: index.toString(),
//     //           thumbnailUrl:
//     //               'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
//     //           isAdminVariant: true,
//     //         );
//     //       },
//     //     ),
//     // GridView.count(
//     //   crossAxisCount: 2,
//     //   mainAxisSpacing: 16,
//     //   crossAxisSpacing: 16,
//     //   childAspectRatio: 1.13,
//     //   children: [
//     //     CategoryCard(
//     //       title: 'Event',
//     //       svgAsset: 'assets/category/event.svg',
//     //       subtitle: 'Berisi informasi mengenai kegiatan HM, AM, & UKM',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Sistore',
//     //       svgAsset: 'assets/category/sistore.svg',
//     //       subtitle: 'Berisi produk - produk yang dijual oleh HIMASKOM',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Beasiswa',
//     //       svgAsset: 'assets/category/beasiswa.svg',
//     //       subtitle: 'Berisi informasi mengenai kegiatan beasiswa',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Prestasi',
//     //       svgAsset: 'assets/category/prestasi.svg',
//     //       subtitle: 'Berisi informasi mengenai database prestasi',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Akademik',
//     //       svgAsset: 'assets/category/akademik.svg',
//     //       subtitle: 'Berisi informasi mengenai akademik perkuliahan',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Karir',
//     //       svgAsset: 'assets/category/karir.svg',
//     //       subtitle: 'Berisi informasi mengenai loker dan magang',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Lomba',
//     //       svgAsset: 'assets/category/lomba.svg',
//     //       subtitle: 'Berisi informasi mengenai kegiatan lomba',
//     //       onTap: () {},
//     //     ),
//     //     CategoryCard(
//     //       title: 'Umum',
//     //       svgAsset: 'assets/category/umum.svg',
//     //       subtitle: 'Berisi informasi umum mengenai fakultas dan jurusan',
//     //       onTap: () {},
//     //     ),
//     //   ],
//     // ),
//     ////////////////////////////////////
//     // GridView.builder(
//     //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //     crossAxisCount: 2,
//     //     childAspectRatio: 2 / 3,
//     //     mainAxisSpacing: 16,
//     //     crossAxisSpacing: 16,
//     //   ),
//     //   itemCount: 10,
//     //   itemBuilder: (context, index) {
//     //     return ItemCard(
//     //       judul:
//     //           '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
//     //       id: index.toString(),
//     //       harga: 25000 * (index + 1),
//     //       thumbnailUrl:
//     //           'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
//     //     );
//     //   },
//     // ),
//     // ///////////////////////////////////////
//     // ListView.builder(
//     //   itemCount: 10,
//     //   itemBuilder: (context, index) {
//     //     if (index == 0) {
//     //       return ArticleCard(
//     //         judul:
//     //             '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
//     //         id: index.toString(),
//     //         createdAt: DateTime.now(),
//     //         thumbnailUrl:
//     //             'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
//     //       );
//     //     }
//     //     return ArticleListItem(
//     //       judul:
//     //           '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
//     //       id: index.toString(),
//     //       createdAt: DateTime.now(),
//     //       thumbnailUrl:
//     //           'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
//     //     );
//     //   },
//     // ),
//     //////////////////////////
//     // Center(
//     //   child: Column(
//     //     mainAxisAlignment: MainAxisAlignment.center,
//     //     crossAxisAlignment: CrossAxisAlignment.stretch,
//     //     children: [
//     //       CustomTextFormField(hintText: 'Masukkan nama lengkap'),
//     //       CustomTextFormField(
//     //         hintText: 'Min 10',
//     //         minLength: 10,
//     //       ),
//     //       CustomTextFormField(
//     //         hintText: 'Masukkan password anda',
//     //         textInputType: TextInputType.visiblePassword,
//     //       ),
//     //       CustomTextFormField(
//     //           hintText: 'Masukkan Deskripsi', multiline: true),
//     //       CustomButton(
//     //         text: 'Masuk',
//     //         onTap: () {
//     //           _formKey.currentState?.validate();
//     //         },
//     //       ),
//     //     ],
//     //   ),
//     // ),
//     // ),
//     // ),
//     // );
//   }
// }
