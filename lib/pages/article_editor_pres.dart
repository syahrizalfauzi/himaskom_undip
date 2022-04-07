import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/tag.dart';
import 'package:himaskom_undip/widgets/admin_scaffold.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';
import 'package:himaskom_undip/widgets/custom_text_form_field.dart';
import 'package:himaskom_undip/widgets/image_picker.dart';
import 'package:himaskom_undip/widgets/tag_picker.dart';

class ArticleEditorPagePresentational extends StatelessWidget {
  const ArticleEditorPagePresentational({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      title: 'Article',
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              children: [
                Text(
                  'Tambahkan Foto',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                const ImagePicker(),
                const SizedBox(height: 24),
                const CustomTextFormField(
                  useBorder: false,
                  labelText: "Tambahkan Judul",
                  tipText: "Max. 20 Karakter",
                  hintText: "Masukkan Judul",
                ),
                const SizedBox(height: 24),
                const CustomTextFormField(
                  useBorder: false,
                  labelText: "Tambahkan Tenggat",
                  hintText: "DD/MM/YYYY HH:MM",
                ),
                const SizedBox(height: 24),
                Text(
                  'Pilih Tag',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                TagPicker(tags: const [
                  Tag(title: 'HM', name: 'hm'),
                  Tag(title: 'AM', name: 'am'),
                  Tag(title: 'UKM', name: 'ukm'),
                ], onTap: (_, __) {}),
                const SizedBox(height: 24),
                const CustomTextFormField(
                  useBorder: false,
                  labelText: "Tambahkan Deskripsi",
                  tipText: "Min. 20 Karakter",
                  multiline: true,
                  hintText: "Masukkan Deskripsi",
                ),
                const SizedBox(height: 24),
                const CustomTextFormField(
                  useBorder: false,
                  labelText: "Tambahkan Harga",
                  hintText: "Masukkan Harga (IDR)",
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            width: double.infinity,
            child: CustomButton(onTap: () {}, text: "Selesai"),
          )
        ],
      ),
    );
  }
}
