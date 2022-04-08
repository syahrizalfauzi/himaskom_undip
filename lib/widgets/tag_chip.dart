import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final bool enabled;
  final String title;
  final bool dense;

  const TagChip({
    Key? key,
    required this.title,
    this.enabled = true,
    this.dense = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:
            enabled ? Theme.of(context).primaryColor : const Color(0xFFEEEEEE),
      ),
      padding: dense
          ? const EdgeInsets.symmetric(vertical: 4, horizontal: 6)
          : const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: enabled ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
