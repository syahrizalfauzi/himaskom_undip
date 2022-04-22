import 'package:flutter/material.dart';
import 'package:himaskom_undip/pages/admin_con.dart';
import 'package:himaskom_undip/pages/loading_con.dart';
import 'package:himaskom_undip/pages/login_con.dart';
import 'package:himaskom_undip/pages/user_con.dart';

class LoadingPagePresentational extends StatelessWidget {
  final AuthState state;

  const LoadingPagePresentational({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: (() {
        switch (state) {
          case AuthState.loading:
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    Text('Mohon Tunggu...')
                  ],
                ),
              ),
            );
          case AuthState.admin:
            return const AdminContainer();
          case AuthState.user:
            return const UserContainer();
          case AuthState.none:
            return const LoginPageContainer();
        }
      })(),
    );
  }
}
