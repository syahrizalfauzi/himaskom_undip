import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool isSelected;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : const Color(0xFFB4B3Ba),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
