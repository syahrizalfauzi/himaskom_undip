import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/customtabview.dart';

class BerandaPagePresentational extends StatelessWidget {
  const BerandaPagePresentational({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTabView(items: [
      ArticleTabItem(fetchUrl: "rekomendasi", title: "Rekomendasi"),
      ArticleTabItem(fetchUrl: "umum", title: "Umum"),
      ArticleTabItem(fetchUrl: "event", title: "Event"),
      ArticleTabItem(fetchUrl: "sistore", title: "Sistore"),
      ArticleTabItem(fetchUrl: "beasiswa", title: "Beasiswa"),
      ArticleTabItem(fetchUrl: "prestasi", title: "Prestasi"),
      ArticleTabItem(fetchUrl: "akademik", title: "Akademik"),
      ArticleTabItem(fetchUrl: "karir", title: "Karir"),
      ArticleTabItem(fetchUrl: "lomba", title: "Lomba"),
    ]);
  }
}
