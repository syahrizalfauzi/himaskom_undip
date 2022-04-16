import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/admin_con.dart';
import 'package:himaskom_undip/pages/article_detail_con.dart';
import 'package:himaskom_undip/pages/login_con.dart';
import 'package:himaskom_undip/pages/user_con.dart';

enum AuthState { loading, admin, user, none }

class AuthSwitcher extends HookWidget {
  const AuthSwitcher({Key? key}) : super(key: key);

  final isAdmin = true;

  @override
  Widget build(BuildContext context) {
    final _state = useState(AuthState.loading);

    useEffect(() {
      final authSubscription =
          FirebaseAuth.instance.userChanges().listen((user) {
        if (user == null) {
          _state.value = AuthState.none;
        } else {
          if (user.uid == 'bBWpeRswZyPn5j0SKEiQ28Pz84W2') {
            _state.value = AuthState.admin;
          } else {
            _state.value = AuthState.user;
          }
        }
      });
      final notifSubscription =
          AwesomeNotifications().actionStream.listen((event) {
        final payload = event.payload;
        if (payload == null || _state.value != AuthState.user) return;

        final article = Article.fromNotifJson({
          'id': payload['id'],
          'judul': payload['judul'],
          'jenisId': payload['jenisId'].toString()
        });
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ArticleDetailPageContainer(article: article)));
      });

      return () {
        Future.wait([
          authSubscription.cancel(),
          notifSubscription.cancel(),
        ]);
      };
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
      child: (() {
        switch (_state.value) {
          case AuthState.loading:
            return const Center(child: CircularProgressIndicator());
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
