import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ArticleShortItem extends StatelessWidget {
  final String id;
  final String judul;
  final bool isAdminVariant;
  final String? thumbnailUrl;

  const ArticleShortItem({
    Key? key,
    required this.id,
    required this.judul,
    this.isAdminVariant = false,
    this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isAdminVariant) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.15,
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                onPressed: (context) {},
                backgroundColor: const Color(0xFFFE7575),
                foregroundColor: Colors.white,
                icon: Icons.delete_outline,
                spacing: 4,
                flex: 1,
              ),
            ],
          ),
          child: Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFECECEE),
              ),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
            ),
            margin: EdgeInsets.zero,
            elevation: 0,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  judul,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Card(
      elevation: 10,
      shadowColor: const Color(0x328D92AB),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 56,
                  width: 56,
                  child: Image.network(
                    thumbnailUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  judul,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}