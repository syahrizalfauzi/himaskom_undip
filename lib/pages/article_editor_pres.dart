import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/tag.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';
import 'package:himaskom_undip/widgets/custom_text_form_field.dart';
import 'package:himaskom_undip/widgets/image_picker.dart';
import 'package:himaskom_undip/widgets/tag_picker.dart';

class ArticleEditorPagePresentational extends StatelessWidget {
  final bool isLoading;
  final List<String> initialImageUrls;
  final void Function(List<ImageProvider>) onImageChange;
  final void Function(String) onImageRemove;
  final bool isImageError;
  final TextEditingController judulController;
  final TextEditingController deskripsiController;
  final String? Function(String) hargaValidator;
  final String? Function(String) tenggatDateValidator;
  final String? Function(String) tenggatTimeValidator;
  final void Function(String) onJudulSubmit;
  final FocusNode deskripsiNode;
  final void Function() onSubmit;
  final void Function()? onTenggatDateTap;
  final void Function()? onTenggatTimeTap;
  final TextEditingController? tenggatDateController;
  final TextEditingController? tenggatTimeController;
  final List<Tag>? tags;
  final void Function(int)? onTagChange;
  final int? selectedTagIndex;
  final TextEditingController? hargaController;

  const ArticleEditorPagePresentational({
    Key? key,
    required this.isLoading,
    required this.initialImageUrls,
    required this.onImageChange,
    required this.onImageRemove,
    required this.isImageError,
    required this.judulController,
    required this.deskripsiController,
    required this.hargaValidator,
    required this.tenggatDateValidator,
    required this.tenggatTimeValidator,
    required this.onJudulSubmit,
    required this.deskripsiNode,
    required this.onSubmit,
    this.onTenggatDateTap,
    this.onTenggatTimeTap,
    this.tenggatDateController,
    this.tenggatTimeController,
    this.tags,
    this.onTagChange,
    this.selectedTagIndex,
    this.hargaController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !isLoading,
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
                AbsorbPointer(
                  absorbing: isLoading,
                  child: ImagePicker(
                    onChange: onImageChange,
                    onRemove: onImageRemove,
                    initialImageUrls: initialImageUrls,
                    isError: isImageError,
                  ),
                ),
                if (isImageError) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Harus diisi',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ],
                const SizedBox(height: 24),
                CustomTextFormField(
                  disabled: isLoading,
                  useBorder: false,
                  labelText: "Tambahkan Judul",
                  tipText: "Max. 20 Karakter",
                  hintText: "Masukkan Judul",
                  textInputAction: TextInputAction.next,
                  controller: judulController,
                  minLength: 5,
                  maxLength: 20,
                  onSubmit: onJudulSubmit,
                ),
                if (tenggatDateController != null &&
                    onTenggatDateTap != null &&
                    tenggatTimeController != null &&
                    onTenggatTimeTap != null) ...[
                  const SizedBox(height: 24),
                  Text(
                    'Tambahkan Tenggat',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          disabled: isLoading,
                          useBorder: false,
                          hintText: "DD/MM/YYYY",
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                          controller: tenggatDateController,
                          onTap: onTenggatDateTap,
                          validator: tenggatDateValidator,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: CustomTextFormField(
                            disabled: isLoading,
                            useBorder: false,
                            hintText: "HH:MM",
                            suffixIcon: const Icon(Icons.watch_later_outlined),
                            controller: tenggatTimeController,
                            onTap: onTenggatTimeTap,
                            validator: tenggatTimeValidator),
                      ),
                    ],
                  ),
                ],
                if (tags != null &&
                    onTagChange != null &&
                    selectedTagIndex != null) ...[
                  const SizedBox(height: 24),
                  Text(
                    'Pilih Tag',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  AbsorbPointer(
                    absorbing: isLoading,
                    child: TagPicker(
                      tags: tags!,
                      onTap: onTagChange!,
                      selectedIndex: selectedTagIndex!,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                CustomTextFormField(
                  disabled: isLoading,
                  useBorder: false,
                  labelText: "Tambahkan Deskripsi",
                  tipText: "Min. 20 Karakter",
                  multiline: true,
                  hintText: "Masukkan Deskripsi",
                  controller: deskripsiController,
                  minLength: 20,
                  focusNode: deskripsiNode,
                ),
                if (hargaController != null) ...[
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    validator: hargaValidator,
                    disabled: isLoading,
                    useBorder: false,
                    labelText: "Tambahkan Harga",
                    hintText: "Masukkan Harga (IDR)",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    controller: hargaController,
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            width: double.infinity,
            child: CustomButton(
              onTap: onSubmit,
              text: "Selesai",
              loading: isLoading,
            ),
          )
        ],
      ),
    );
  }
}
