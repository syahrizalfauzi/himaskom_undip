import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/profile_pres.dart';

class ProfilePageContainer extends HookWidget {
  const ProfilePageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = useMemoized(() => FirebaseAuth.instance.currentUser!, []);

    return ProfilePagePresentational(
      email: _user.email!,
      name: _user.displayName!,
      avatarUrl: _user.photoURL,
    );
  }
}
