import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/tag.dart';

class TagPicker extends StatelessWidget {
  final List<Tag> tags;
  final int selectedIndex;
  final void Function(Tag, int) onTap;

  const TagPicker({
    Key? key,
    required this.tags,
    this.selectedIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => onTap(tags[index], index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index == selectedIndex
                  ? Theme.of(context).primaryColor
                  : const Color(0xFFEEEEEE),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              tags[index].title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: index == selectedIndex
                    ? Colors.white
                    : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
