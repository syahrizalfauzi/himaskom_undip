import 'package:himaskom_undip/utils/parse_article_category.dart';
import 'package:intl/intl.dart';

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
  final String judul;
  final ArticleCategory jenis;
  final int harga;
  final bool isSaved;
  final String? id;
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
    this.isSaved = false,
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
      tenggat: json['tenggat'] == null
          ? null
          : DateTime.tryParse(
              json['tenggat'],
            ),
      jenis: parseArticleCategory(json['jenis']),
      harga: json['harga'],
      deskripsi: json['deskripsi'],
    );
  }

  factory Article.fromNotifJson(Map<String, dynamic> notifJson) {
    return Article(
      id: notifJson['id'],
      judul: notifJson['judul'],
      jenis: ArticleCategory.values[int.parse(notifJson['jenisId'].toString())],
      gambarUrl: [],
      harga: 0,
      tenggat: null,
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

  Map<String, dynamic> get toNotifJson {
    return {
      'id': id,
      'judul': judul,
      'jenisId': jenis.index,
    };
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

  String get shareString {
    final sistoreText = jenis == ArticleCategory.sistore
        ? NumberFormat.currency(
            locale: 'id_ID',
            symbol: "Rp. ",
            decimalDigits: 0,
          ).format(harga)
        : "";
    final eventText = tenggat != null
        ? "Tenggat : " + DateFormat('dd MMM y').format(tenggat!)
        : "";
    String text =
        "[$jenisString] $judul\n$sistoreText\n$deskripsi\n$eventText\n${DateFormat('dd MMM y').format(createdAt!)}";

    return text;
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
    bool? isSaved,
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
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  String toString() {
    return 'Article(judul: $judul, isSaved: $isSaved)';
  }
}


// https://cdn.discordapp.com/attachments/340561913710772225/963622211204304976/unknown.png