import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himaskom_undip/widgets/itemcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIMASKOM UNDIP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF171936),
          primary: const Color(0xFF171936),
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const Page(),
    );
  }
}

class Page extends StatefulHookWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Form(
        key: _formKey,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ItemCard(
              judul:
                  '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
              id: index.toString(),
              harga: 25000 * (index + 1),
              thumbnailUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
            );
          },
        ),
        // ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     if (index == 0) {
        //       return ArticleCard(
        //         judul:
        //             '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
        //         id: index.toString(),
        //         createdAt: DateTime.now(),
        //         thumbnailUrl:
        //             'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
        //       );
        //     }
        //     return ArticleListItem(
        //       judul:
        //           '[Jenis] Article Nomor $index Tapi Super Duper Panjang Kayak Gimana Gitu Ya SAD ASD ASD ASD ADS ASD ASD ASD ',
        //       id: index.toString(),
        //       createdAt: DateTime.now(),
        //       thumbnailUrl:
        //           'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
        //     );
        //   },
        // ),
        //////////////////////////
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       CustomTextFormField(hintText: 'Masukkan nama lengkap'),
        //       CustomTextFormField(
        //         hintText: 'Min 10',
        //         minLength: 10,
        //       ),
        //       CustomTextFormField(
        //         hintText: 'Masukkan password anda',
        //         textInputType: TextInputType.visiblePassword,
        //       ),
        //       CustomTextFormField(
        //           hintText: 'Masukkan Deskripsi', multiline: true),
        //       CustomButton(
        //         text: 'Masuk',
        //         onTap: () {
        //           _formKey.currentState?.validate();
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
