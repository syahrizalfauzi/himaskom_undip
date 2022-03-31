import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  final String judul;
  final String id;
  final int harga;
  final String thumbnailUrl;
  const ItemCard({
    Key? key,
    required this.judul,
    required this.id,
    required this.harga,
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
                  aspectRatio: 1,
                  child: Image.network(thumbnailUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                judul,
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
                ).format(harga),
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
