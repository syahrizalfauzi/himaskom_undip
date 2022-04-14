import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/notifikasi_settings_pres.dart';
import 'package:himaskom_undip/states/notifikasi_article.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotifikasiSettingsContainer extends HookConsumerWidget {
  const NotifikasiSettingsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _isLoading = useState(false);
    final _isChanged = useState(false);
    final _state = ref
        .read(notifikasiArticleState)
        .notifPrefs
        .entries
        .map((e) => MapEntry(e.key, useState(e.value)))
        .toList();

    _handlePilihSemua(bool? value) {
      _isChanged.value = true;
      for (final e in _state) {
        e.value.value = value ?? false;
      }
    }

    _handleChange(bool? value, String key) {
      _isChanged.value = true;

      final index = _state.indexWhere((e) => e.key == key);
      _state[index].value.value = value ?? false;
    }

    _handleSave() async {
      final _articleState = ref.read(notifikasiArticleState);
      _articleState.setPreferences(
          Map.fromEntries(_state.map((e) => MapEntry(e.key, e.value.value))));
      final prefsMap = _articleState.prefsMap;

      if (!_isChanged.value) {
        Navigator.of(context).pop(prefsMap);
        return;
      }

      _isLoading.value = true;
      await _articleState.savePreferences();
      _isLoading.value = false;

      Navigator.of(context).pop(prefsMap);
    }

    return WillPopScope(
      onWillPop: () async => !_isLoading.value,
      child: NotifikasiSettingsPresentational(
        onPilihSemua: _handlePilihSemua,
        onSave: _handleSave,
        isLoading: _isLoading.value,
        pilihSemua: _state.map((e) => e.value.value).reduce((a, b) => a && b),
        items: _state
            .map(
              (e) => CheckBoxItem(
                onChange: (v) => _handleChange(v, e.key),
                value: e.value.value,
                title: e.key,
              ),
            )
            .toList(),
      ),
    );
  }
}
