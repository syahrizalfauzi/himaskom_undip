import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool?) onChange;
  final bool value;
  final String title;

  const CustomCheckBox({
    Key? key,
    required this.onChange,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange(!value),
      child: Container(
        height: 36,
        color: Colors.transparent,
        width: double.infinity,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChange,
              activeColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
