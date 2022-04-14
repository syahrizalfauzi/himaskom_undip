import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setNotificationPreferences(bool condition) async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final messaging = FirebaseMessaging.instance;

  final preferences = sharedPrefs.setString(
    'notifprefs',
    jsonEncode(Map.fromEntries(ArticleCategory.values.map(
      (e) => MapEntry(e.index.toString(), condition),
    ))),
  );
  final subscriptions = ArticleCategory.values.map((e) {
    if (condition) {
      return messaging.subscribeToTopic(e.index.toString());
    }
    return messaging.unsubscribeFromTopic(e.index.toString());
  });

  await Future.wait([preferences, ...subscriptions]);
}
