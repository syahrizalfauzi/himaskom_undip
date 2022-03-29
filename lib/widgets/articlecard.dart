import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleCard extends StatelessWidget {
  final String judul;
  final String id;
  final DateTime createdAt;
  final String thumbnailUrl;
  const ArticleCard({
    Key? key,
    required this.judul,
    required this.id,
    required this.createdAt,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: const Color(0x328D92AB),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.network(thumbnailUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                judul,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('dd MMM y').format(createdAt),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB4B3BA),
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.bookmark_outline,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        child: Icon(
                          Icons.ios_share,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
