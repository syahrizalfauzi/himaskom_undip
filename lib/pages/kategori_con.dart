import 'package:flutter/material.dart';
import 'package:himaskom_undip/pages/kategori_pres.dart';

class KategoriPageContainer extends StatelessWidget {
  const KategoriPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTap() => debugPrint('category tapped');

    return KategoriPagePresentational(
      onTapAkademik: _handleTap,
      onTapBeasiswa: _handleTap,
      onTapEvent: _handleTap,
      onTapKarir: _handleTap,
      onTapLomba: _handleTap,
      onTapPrestasi: _handleTap,
      onTapSistore: _handleTap,
      onTapUmum: _handleTap,
    );
  }
}
