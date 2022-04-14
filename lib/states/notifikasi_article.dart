import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/models/article_state.dart';
import 'package:himaskom_undip/utils/convert_notif_article.dart';
import 'package:himaskom_undip/utils/convert_notif_prefs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notifikasiArticleState =
    ChangeNotifierProvider((_) => NotifikasiArticleState());

class NotifikasiArticleState extends ArticleState {
  @override
  final String title = "Notifikasi";

  Map<String, bool> notifPrefs = {
    'Umum': false,
    'Event': false,
    'Sistore': false,
    'Beasiswa': false,
    'Prestasi': false,
    'Akademik': false,
    'Karir': false,
    'Lomba': false
  };

  @override
  Future<void> getAll([bool notify = true]) async {
    if (notify) {
      isLoading = true;
      notifyListeners();
    }

    final sharedPrefs = await SharedPreferences.getInstance();

    try {
      articles = articleListFromEncodedArticles(
          sharedPrefs.getStringList('notifarticles')!);
    } catch (e) {
      debugPrint(e.toString());
      articles = [];
    }

    isLoading = false;
    notifyListeners();
  }

  @override
  Future<void> delete({
    required Article article,
    String token = "",
  }) async {
    isLoading = true;
    notifyListeners();

    final sharedPrefs = await SharedPreferences.getInstance();

    articles.removeWhere((e) => e.id == article.id);

    sharedPrefs.setStringList(
        'notifarticles', encodedArticlesFromArticleList(articles));

    isLoading = false;
    notifyListeners();
  }

  String get enabledPrefs {
    if (notifPrefs.entries.every((e) => e.value)) return "Semua kategori";
    if (notifPrefs.entries.every((e) => !e.value)) return "Tidak aktif";
    return notifPrefs.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .join(', ');
  }

  Map<String, bool> get prefsMap => storedPrefsFromStatePrefs(notifPrefs);

  void setPreferences(Map<String, bool> preferences) {
    notifPrefs = preferences;
    notifyListeners();
  }

  Future<void> getPreferences() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    try {
      notifPrefs = statePrefsFromStoredPrefs(
          Map.from(jsonDecode(sharedPrefs.getString('notifprefs')!)));
    } catch (e) {
      notifPrefs = {
        'Umum': false,
        'Event': false,
        'Sistore': false,
        'Beasiswa': false,
        'Prestasi': false,
        'Akademik': false,
        'Karir': false,
        'Lomba': false,
      };
    }

    notifyListeners();
  }

  Future<void> savePreferences() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final messaging = FirebaseMessaging.instance;

    final preferences = sharedPrefs.setString(
      'notifprefs',
      jsonEncode(prefsMap),
    );
    final subscriptions = prefsMap.entries.map((e) {
      if (e.value) {
        return messaging.subscribeToTopic(e.key.toString());
      }
      return messaging.unsubscribeFromTopic(e.key.toString());
    });

    await Future.wait([
      preferences,
      ...subscriptions,
    ]);
  }
}
