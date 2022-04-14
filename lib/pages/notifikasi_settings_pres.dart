import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';
import 'package:himaskom_undip/widgets/custom_checkbox.dart';

class CheckBoxItem {
  final void Function(bool?) onChange;
  final bool value;
  final String title;

  const CheckBoxItem({
    required this.onChange,
    required this.value,
    required this.title,
  });
}

class NotifikasiSettingsPresentational extends StatelessWidget {
  final bool isLoading;
  final void Function(bool?) onPilihSemua;
  final void Function() onSave;
  final bool pilihSemua;
  final List<CheckBoxItem> items;

  const NotifikasiSettingsPresentational({
    Key? key,
    required this.isLoading,
    required this.onPilihSemua,
    required this.onSave,
    required this.pilihSemua,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Pengaturan Notifikasi',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomCheckBox(
            onChange: onPilihSemua,
            value: pilihSemua,
            title: "Pilih Semua",
            disabled: isLoading,
          ),
          const SizedBox(height: 12),
          ...items.map(
            (e) => CustomCheckBox(
              onChange: e.onChange,
              value: e.value,
              title: e.title,
              disabled: isLoading,
            ),
          ),
        ],
      ),
      actions: [
        CustomButton(
          onTap: onSave,
          text: "Simpan",
          dense: true,
          loading: isLoading,
        ),
      ],
    );
  }
}
