import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/userscaffold.dart';

class DrawerItem extends StatelessWidget {
  final void Function(Pages) onTap;
  final Pages page;
  final bool isSelected;

  const DrawerItem({
    Key? key,
    required this.page,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(page),
      title: Text(
        pageTitle[page.name]!,
        style: TextStyle(
          color: isSelected ? Colors.black : const Color(0xFFB4B3Ba),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
