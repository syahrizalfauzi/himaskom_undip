import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum AuthState { loading, admin, user, none }

class AuthSwitcher extends HookWidget {
  const AuthSwitcher({Key? key}) : super(key: key);

  final isAdmin = true;

  @override
  Widget build(BuildContext context) {
    final _state = useState(AuthState.loading);
    // final _userStream = useStream(FirebaseAuth.instance.userChanges().listen());

    useEffect(() {
      // final sub =
      //     FirebaseAuth.instance.userChanges().listen((_authState) async {
      //   if (_authState != null) {
      //     if (admins.contains(_authState.uid)) {
      //       _widget.value = AdminHome();
      //     } else {
      //       await FirebaseMessaging.instance.subscribeToTopic('notification');
      //       try {
      //         // Bakal throw error kalo belum ada nama atau namanya masih string
      //         final displayName = jsonDecode(_authState.displayName!);
      //         final nama = displayName['nama'] as String;
      //         final nim = displayName['nim'] as String;
      //         final jurusan = displayName['jurusan'] as String;
      //         if (nama.isNotEmpty && nim.isNotEmpty && jurusan.isNotEmpty) {
      //           _widget.value = UserWrapper();
      //         } else {
      //           throw Error;
      //         }
      //       } catch (e) {
      //         _widget.value = UserProfileInput(
      //           name: _authState.displayName,
      //         );
      //       }
      //     }
      //   } else {
      //     await FirebaseMessaging.instance.unsubscribeFromTopic('notification');
      //     _widget.value = UserLogin();
      //   }
      // });

      // return sub.cancel;
    }, []);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeOutExpo,
      switchOutCurve: Curves.easeOutExpo,
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      child: null,
    );
  }
}
