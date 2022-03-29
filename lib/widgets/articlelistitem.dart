import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleListItem extends StatelessWidget {
  final String judul;
  final String id;
  final DateTime createdAt;
  final String thumbnailUrl;

  const ArticleListItem({
    Key? key,
    required this.judul,
    required this.id,
    required this.createdAt,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('dd MMM y').format(createdAt),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFFB4B3BA),
                fontSize: 12,
              ),
            )
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 86,
            width: 86,
            child: Image.network(thumbnailUrl, fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}
