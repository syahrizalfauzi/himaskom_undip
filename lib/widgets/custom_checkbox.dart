import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool?) onChange;
  final bool value;
  final String title;
  final bool disabled;

  const CustomCheckBox({
    Key? key,
    required this.onChange,
    required this.value,
    required this.title,
    required this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : () => onChange(!value),
      child: Container(
        height: 36,
        color: Colors.transparent,
        width: double.infinity,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: disabled ? null : onChange,
              activeColor: disabled
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  color: disabled
                      ? Theme.of(context).disabledColor
                      : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
