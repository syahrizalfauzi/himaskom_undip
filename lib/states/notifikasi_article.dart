import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:himaskom_undip/models/article_state.dart';
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
    // FETCH FROM LOCAL STORAGE
    await Future.delayed(const Duration(seconds: 1));
    articles = [];
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

  Map<String, bool> get prefsMap => prefsMapFromStateMap(notifPrefs);

  // void setPreference(String key, bool value) {
  //   notifPrefs.update(key, (v) => value);
  //   notifyListeners();
  // }

  // void setAllPreferences(bool value) {
  //   notifPrefs.updateAll((k, v) => v = value);
  //   notifyListeners();
  // }
  void setPreferences(Map<String, bool> preferences) {
    notifPrefs = preferences;
    notifyListeners();
  }

  Future<void> getPreferences() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    try {
      notifPrefs = stateMapFromPrefsMap(
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
