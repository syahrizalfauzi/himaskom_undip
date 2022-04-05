import 'package:flutter/material.dart';
import 'package:himaskom_undip/pages/profile_pres.dart';

class ProfilePageContainer extends StatelessWidget {
  const ProfilePageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfilePagePresentational(
      email: 'syahrizal@gmail.com',
      name: 'Syahrizal Fauzi',
    );
  }
}
