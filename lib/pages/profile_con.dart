import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:himaskom_undip/pages/profile_pres.dart';

class ProfilePageContainer extends StatelessWidget {
  const ProfilePageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser!;

    return ProfilePagePresentational(
      email: _user.email!,
      name: _user.displayName!,
      avatarUrl: _user.photoURL,
    );
  }
}
