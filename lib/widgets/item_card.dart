import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  final Article article;
  const ItemCard({
    Key? key,
    required this.article,
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
                  aspectRatio: 1,
                  child:
                      Image.network(article.gambarUrl![0], fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                article.judul,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                NumberFormat.currency(
                  locale: 'id_ID',
                  symbol: "Rp. ",
                  decimalDigits: 0,
                ).format(article.harga),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB4B3BA),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
