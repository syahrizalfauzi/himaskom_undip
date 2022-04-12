import 'package:himaskom_undip/models/article.dart';

ArticleCategory parseArticleCategory(String jenis) {
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
