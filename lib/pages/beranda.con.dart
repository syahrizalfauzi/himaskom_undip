import 'package:flutter/material.dart';
import 'package:himaskom_undip/pages/beranda.pres.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BerandaPageContainer extends HookConsumerWidget {
  const BerandaPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return const BerandaPagePresentational();
  }
}
