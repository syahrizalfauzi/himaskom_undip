import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:himaskom_undip/models/article.dart';

class ArticleJenisIcon extends StatelessWidget {
  final ArticleCategory jenis;

  const ArticleJenisIcon({Key? key, required this.jenis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String asset = 'umum';
    switch (jenis) {
      case ArticleCategory.umum:
        asset = 'umum';
        break;
      case ArticleCategory.eventHm:
        asset = 'event';
        break;
      case ArticleCategory.eventAm:
        asset = 'event';
        break;
      case ArticleCategory.eventUkm:
        asset = 'event';
        break;
      case ArticleCategory.sistore:
        asset = 'sistore';
        break;
      case ArticleCategory.beasiswa:
        asset = 'beasiswa';
        break;
      case ArticleCategory.prestasi:
        asset = 'prestasi';
        break;
      case ArticleCategory.akademik:
        asset = 'akademik';
        break;
      case ArticleCategory.karirLoker:
        asset = 'karir';
        break;
      case ArticleCategory.karirMagang:
        asset = 'karir';
        break;
      case ArticleCategory.lombaAkademik:
        asset = 'lomba';
        break;
      case ArticleCategory.lombaNonakademik:
        asset = 'lomba';
        break;
    }
    return SvgPicture.asset(
      'assets/category/$asset.svg',
      height: 20,
      width: 20,
    );
  }
}
