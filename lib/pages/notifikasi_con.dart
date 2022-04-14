import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/models/article.dart';
import 'package:himaskom_undip/pages/notifikasi_pres.dart';
import 'package:himaskom_undip/pages/notifikasi_settings_con.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:himaskom_undip/utils/convert_notif_prefs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifikasiPageContainer extends HookConsumerWidget {
  final Function(Article) onTapArticle;

  const NotifikasiPageContainer({
    Key? key,
    required this.onTapArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _articleState = ref.watch(notifikasiArticleState);
    final _settingsSubstitle = useState("Semua Kategori");

    _handleTapSettings() async {
      final sharedPref = await SharedPreferences.getInstance();
      final prefs = prefsMapFromList(List.generate(
        10,
        (index) => sharedPref.getBool(index.toString()) ?? false,
      ));

      final result = await showDialog<Map<String, bool>>(
        context: context,
        builder: (context) => NotifikasiSettingsContainer(
          initialPreferences: prefs,
        ),
      );
      if (result == null) return;

      final resultEntries = prefsEntriesFromMap(result);
      final notifPreferences = resultEntries
          .map((e) => sharedPref.setBool(e.key.toString(), e.value));
      final subscriptionUpdate = resultEntries.map((e) {
        if (e.value) {
          return FirebaseMessaging.instance.subscribeToTopic(e.key.toString());
        }
        return FirebaseMessaging.instance
            .unsubscribeFromTopic(e.key.toString());
      });

      await Future.wait([
        ...notifPreferences,
        ...subscriptionUpdate,
      ]);
    }

    _handleDeleteArticle(Article article) async {}

    useEffect(() {
      _articleState.getAll(false);
      return;
    }, []);

    return NotifikasiPagePresentational(
      articles: _articleState.articles,
      onRefresh: _articleState.getAll,
      isLoading: _articleState.isLoading,
      settingsSubtitle: _settingsSubstitle.value,
      onTapArticle: onTapArticle,
      onDeleteArticle: _handleDeleteArticle,
      onTapSettings: _handleTapSettings,
    );
  }
}
