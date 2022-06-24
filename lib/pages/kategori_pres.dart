import 'package:flutter/material.dart';
import 'package:himaskom_undip/widgets/category_card.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class KategoriPagePresentational extends StatelessWidget {
  final void Function() onTapEvent;
  final void Function() onTapSistore;
  final void Function() onTapBeasiswa;
  final void Function() onTapPrestasi;
  final void Function() onTapAkademik;
  final void Function() onTapKarir;
  final void Function() onTapLomba;
  final void Function() onTapUmum;

  const KategoriPagePresentational({
    Key? key,
    required this.onTapEvent,
    required this.onTapSistore,
    required this.onTapBeasiswa,
    required this.onTapPrestasi,
    required this.onTapAkademik,
    required this.onTapKarir,
    required this.onTapLomba,
    required this.onTapUmum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryCard(
        title: 'Event',
        svgAsset: 'assets/category/event.svg',
        subtitle: 'Berisi informasi mengenai kegiatan HM, AM, & UKM',
        onTap: onTapEvent,
      ),
      CategoryCard(
        title: 'Sistore',
        svgAsset: 'assets/category/sistore.svg',
        subtitle: 'Berisi produk - produk yang dijual oleh HIMASKOM',
        onTap: onTapSistore,
      ),
      CategoryCard(
        title: 'Beasiswa',
        svgAsset: 'assets/category/beasiswa.svg',
        subtitle: 'Berisi informasi mengenai kegiatan beasiswa',
        onTap: onTapBeasiswa,
      ),
      CategoryCard(
        title: 'Prestasi',
        svgAsset: 'assets/category/prestasi.svg',
        subtitle: 'Berisi informasi mengenai database prestasi',
        onTap: onTapPrestasi,
      ),
      CategoryCard(
        title: 'Akademik',
        svgAsset: 'assets/category/akademik.svg',
        subtitle: 'Berisi informasi mengenai akademik perkuliahan',
        onTap: onTapAkademik,
      ),
      CategoryCard(
        title: 'Karir',
        svgAsset: 'assets/category/karir.svg',
        subtitle: 'Berisi informasi mengenai loker dan magang',
        onTap: onTapKarir,
      ),
      CategoryCard(
        title: 'Lomba',
        svgAsset: 'assets/category/lomba.svg',
        subtitle: 'Berisi informasi mengenai kegiatan lomba',
        onTap: onTapLomba,
      ),
      CategoryCard(
        title: 'Umum',
        svgAsset: 'assets/category/umum.svg',
        subtitle: 'Berisi informasi umum mengenai fakultas dan jurusan',
        onTap: onTapUmum,
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      color: const Color(0xFFFAFAFA),
      child: DynamicHeightGridView(
        itemCount: categories.length,
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        builder: (_, i) => categories[i],
      ),
      // GridView.count(
      //   crossAxisCount: 2,
      //   mainAxisSpacing: 16,
      //   crossAxisSpacing: 16,
      //   childAspectRatio: 1.13,
      //   children: [
      //     CategoryCard(
      //       title: 'Event',
      //       svgAsset: 'assets/category/event.svg',
      //       subtitle: 'Berisi informasi mengenai kegiatan HM, AM, & UKM',
      //       onTap: onTapEvent,
      //     ),
      //     CategoryCard(
      //       title: 'Sistore',
      //       svgAsset: 'assets/category/sistore.svg',
      //       subtitle: 'Berisi produk - produk yang dijual oleh HIMASKOM',
      //       onTap: onTapSistore,
      //     ),
      //     CategoryCard(
      //       title: 'Beasiswa',
      //       svgAsset: 'assets/category/beasiswa.svg',
      //       subtitle: 'Berisi informasi mengenai kegiatan beasiswa',
      //       onTap: onTapBeasiswa,
      //     ),
      //     CategoryCard(
      //       title: 'Prestasi',
      //       svgAsset: 'assets/category/prestasi.svg',
      //       subtitle: 'Berisi informasi mengenai database prestasi',
      //       onTap: onTapPrestasi,
      //     ),
      //     CategoryCard(
      //       title: 'Akademik',
      //       svgAsset: 'assets/category/akademik.svg',
      //       subtitle: 'Berisi informasi mengenai akademik perkuliahan',
      //       onTap: onTapAkademik,
      //     ),
      //     CategoryCard(
      //       title: 'Karir',
      //       svgAsset: 'assets/category/karir.svg',
      //       subtitle: 'Berisi informasi mengenai loker dan magang',
      //       onTap: onTapKarir,
      //     ),
      //     CategoryCard(
      //       title: 'Lomba',
      //       svgAsset: 'assets/category/lomba.svg',
      //       subtitle: 'Berisi informasi mengenai kegiatan lomba',
      //       onTap: onTapLomba,
      //     ),
      //     CategoryCard(
      //       title: 'Umum',
      //       svgAsset: 'assets/category/umum.svg',
      //       subtitle: 'Berisi informasi umum mengenai fakultas dan jurusan',
      //       onTap: onTapUmum,
      //     ),
      //   ],
      // ),
    );
  }
}
