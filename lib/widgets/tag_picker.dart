import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/tag.dart';
import 'package:himaskom_undip/widgets/tag_chip.dart';

class TagPicker extends StatelessWidget {
  final List<Tag> tags;
  final int selectedIndex;
  final void Function(int) onTap;

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
          onTap: () => onTap(index),
          child: TagChip(
            title: tags[selectedIndex].title,
            enabled: selectedIndex == index,
          ),
        ),
      ),
    );
  }
}
