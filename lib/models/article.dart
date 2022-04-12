import 'package:himaskom_undip/utils/parse_article_category.dart';

enum ArticleCategory {
  umum,
  eventHm,
  eventAm,
  eventUkm,
  sistore,
  beasiswa,
  prestasi,
  akademik,
  karirLoker,
  karirMagang,
  lombaAkademik,
  lombaNonakademik,
}

enum PostVariant { article, item, event }

class Article {
  final String? id;
  final String judul;
  final ArticleCategory jenis;
  final int harga;
  final List<String>? gambarUrl;
  final DateTime? createdAt;
  final DateTime? tenggat;
  final String? deskripsi;

  Article({
    required this.judul,
    required this.gambarUrl,
    required this.jenis,
    required this.harga,
    required this.tenggat,
    this.id,
    this.createdAt,
    this.deskripsi,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      judul: json['judul'],
      gambarUrl: (json['gambarUrl'] as List).map((e) => e.toString()).toList(),
      createdAt: DateTime.parse(json['createdAt']),
      tenggat:
          json['tenggat'] == null ? null : DateTime.tryParse(json['tenggat']),
      jenis: parseArticleCategory(json['jenis']),
      harga: json['harga'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> get toJson {
    final map = {
      'judul': judul,
      'gambarUrl': gambarUrl,
      'jenisId': jenis.index,
      'harga': harga,
      'deskripsi': deskripsi,
    };
    if (tenggat != null) {
      map.addEntries({'tenggat': tenggat.toString()}.entries);
    }

    return map;
  }

  String get jenisString {
    switch (jenis) {
      case ArticleCategory.umum:
        return 'Umum';
      case ArticleCategory.eventHm:
        return 'Event';
      case ArticleCategory.eventAm:
        return 'Event';
      case ArticleCategory.eventUkm:
        return 'Event';
      case ArticleCategory.sistore:
        return 'Sistore';
      case ArticleCategory.beasiswa:
        return 'Beasiswa';
      case ArticleCategory.prestasi:
        return 'Prestasi';
      case ArticleCategory.akademik:
        return 'Akademik';
      case ArticleCategory.karirLoker:
        return 'Karir';
      case ArticleCategory.karirMagang:
        return 'Karir';
      case ArticleCategory.lombaAkademik:
        return 'Lomba';
      case ArticleCategory.lombaNonakademik:
        return 'Lomba';
    }
  }

  PostVariant get variant {
    if (jenis == ArticleCategory.sistore) {
      return PostVariant.item;
    } else if (jenis == ArticleCategory.eventAm ||
        jenis == ArticleCategory.eventHm ||
        jenis == ArticleCategory.eventUkm) {
      return PostVariant.event;
    } else {
      return PostVariant.article;
    }
  }

  Article copyWith({
    String? id,
    String? judul,
    ArticleCategory? jenis,
    int? harga,
    List<String>? gambarUrl,
    DateTime? createdAt,
    DateTime? tenggat,
    String? deskripsi,
  }) {
    return Article(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      jenis: jenis ?? this.jenis,
      harga: harga ?? this.harga,
      gambarUrl: gambarUrl ?? this.gambarUrl,
      createdAt: createdAt ?? this.createdAt,
      tenggat: tenggat ?? this.tenggat,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }
}
