import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/article_detail_con.dart';
import 'package:himaskom_undip/pages/loading_pres.dart';

enum AuthState { loading, admin, user, none }

class LoadingPageContainer extends HookWidget {
  const LoadingPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _state = useState(AuthState.loading);

    useEffect(() {
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

      return () => Future.wait([
            notifSubscription.cancel(),
            authSubscription.cancel(),
          ]);
    }, []);

    return LoadingPagePresentational(state: _state.value);
  }
}
