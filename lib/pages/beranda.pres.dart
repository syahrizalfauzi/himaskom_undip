import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/customtabview.dart';

class BerandaPagePresentational extends StatelessWidget {
  const BerandaPagePresentational({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTabView(items: [
      const ArticleTabItem(fetchUrl: "rekomendasi", title: "Rekomendasi"),
      const ArticleTabItem(fetchUrl: "umum", title: "Umum"),
      const ArticleTabItem(fetchUrl: "event", title: "Event"),
      const ArticleTabItem(fetchUrl: "sistore", title: "Sistore"),
      const ArticleTabItem(fetchUrl: "beasiswa", title: "Beasiswa"),
      const ArticleTabItem(fetchUrl: "prestasi", title: "Prestasi"),
      const ArticleTabItem(fetchUrl: "akademik", title: "Akademik"),
      const ArticleTabItem(fetchUrl: "karir", title: "Karir"),
      const ArticleTabItem(fetchUrl: "lomba", title: "Lomba"),
    ]);
  }
}
