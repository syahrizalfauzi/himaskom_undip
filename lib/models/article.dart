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

ArticleCategory _parseCategory(String jenis) {
  switch (jenis) {
    case "umum":
      return ArticleCategory.umum;
    case "event_hm":
      return ArticleCategory.eventHm;
    case "event_am":
      return ArticleCategory.eventAm;
    case "event_ukm":
      return ArticleCategory.eventUkm;
    case "sistore":
      return ArticleCategory.sistore;
    case "beasiswa":
      return ArticleCategory.beasiswa;
    case "prestasi":
      return ArticleCategory.prestasi;
    case "akademik":
      return ArticleCategory.akademik;
    case "karir_loker":
      return ArticleCategory.karirLoker;
    case "karir_magang":
      return ArticleCategory.karirMagang;
    case "lomba_akademik":
      return ArticleCategory.lombaAkademik;
    case "lomba_nonakademik":
      return ArticleCategory.lombaNonakademik;
    default:
      return ArticleCategory.umum;
  }
}

class Article {
  final String id;
  final String judul;
  final ArticleCategory jenis;
  final List<String>? gambarUrl;
  final int? harga;
  final DateTime? createdAt;
  final DateTime? tenggat;
  final String? deskripsi;

  Article({
    required this.id,
    required this.judul,
    required this.gambarUrl,
    required this.createdAt,
    required this.tenggat,
    required this.jenis,
    required this.harga,
    this.deskripsi,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      judul: json['judul'],
      gambarUrl: (json['gambarUrl'] as List).map((e) => e.toString()).toList(),
      createdAt: DateTime.parse(json['createdAt']),
      tenggat: DateTime.parse(json['tenggat']),
      jenis: _parseCategory(json['jenis']),
      harga: json['harga'],
      deskripsi: json['deskripsi'],
    );
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
}
