import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/custom_button.dart';

class PengingatSettingsPresentational extends StatelessWidget {
  final void Function() onSave;
  final void Function(int?) onChange;
  final int value;

  const PengingatSettingsPresentational({
    Key? key,
    required this.onSave,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Atur Pengingat',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      content: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFB4B3BA)),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: DropdownButton<int>(
          onChanged: onChange,
          isExpanded: true,
          isDense: true,
          value: value,
          underline: Container(),
          icon: const Icon(Icons.keyboard_arrow_down),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF595A6B),
          ),
          items: const [
            DropdownMenuItem(child: Text('Satu hari sebelum'), value: 1440),
            DropdownMenuItem(child: Text('5 jam sebelum'), value: 300),
            DropdownMenuItem(child: Text('3 jam sebelum'), value: 180),
            DropdownMenuItem(child: Text('1 jam sebelum'), value: 60),
            DropdownMenuItem(child: Text('30 menit sebelum'), value: 30),
          ],
        ),
      ),
      actions: [
        CustomButton(
          onTap: onSave,
          text: "Simpan",
          dense: true,
        ),
      ],
    );
  }
}
