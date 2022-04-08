import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/widgets/tag_chip.dart';
import 'package:intl/intl.dart';

class ArticleItemSubtitle extends StatelessWidget {
  final Article article;

  const ArticleItemSubtitle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? child;
    switch (article.jenis) {
      case ArticleCategory.sistore:
        child = Text(
          NumberFormat.currency(
            locale: 'id_ID',
            symbol: "Rp. ",
            decimalDigits: 0,
          ).format(article.harga),
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelSmall,
        );
        break;
      case ArticleCategory.eventHm:
        child = const TagChip(title: "HIMASKOM", dense: true);
        break;
      case ArticleCategory.eventAm:
        child = const TagChip(title: "Al-Muharrik", dense: true);
        break;
      case ArticleCategory.eventUkm:
        child = const TagChip(title: "UKM Tekkom", dense: true);
        break;
      case ArticleCategory.karirLoker:
        child = const TagChip(title: "Lowongan Kerja", dense: true);
        break;
      case ArticleCategory.karirMagang:
        child = const TagChip(title: "Magang", dense: true);
        break;
      case ArticleCategory.lombaAkademik:
        child = const TagChip(title: "Akademik", dense: true);
        break;
      case ArticleCategory.lombaNonakademik:
        child = const TagChip(title: "Non-Akademik", dense: true);
        break;
      default:
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (child != null) ...[
          const SizedBox(height: 8),
          child,
        ]
      ],
    );
  }
}
