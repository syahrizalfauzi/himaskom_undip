import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himaskom_undip/widgets/articlelistitem.dart';

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
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(
            height: 24,
          ),
          itemBuilder: (context, index) {
            return ArticleListItem(
              judul: '[Jenis] Article Nomor $index',
              id: index.toString(),
              createdAt: DateTime.now(),
              thumbnailUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sample_abc.jpg',
            );
          },
        ),
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
