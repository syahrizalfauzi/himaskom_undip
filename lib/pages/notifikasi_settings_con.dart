import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/notifikasi_settings_pres.dart';

class NotifikasiSettingsContainer extends HookWidget {
  const NotifikasiSettingsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _state = {
      'Umum': useState(true),
      'Event': useState(false),
      'Sistore': useState(false),
      'Beasiswa': useState(false),
      'Prestasi': useState(false),
      'Akademik': useState(false),
      'Karir': useState(false),
      'Lomba': useState(false),
    };

    _handlePilihSemua(bool? value) {
      _state.forEach((_, state) => state.value = value ?? false);
    }

    _handleChange(bool? value, String key) {
      _state[key]!.value = value ?? false;
    }

    _handleSave() {
      final result = _state.map((key, value) => MapEntry(key, value.value));
      Navigator.of(context).pop(result);
    }

    return NotifikasiSettingsPresentational(
      onPilihSemua: _handlePilihSemua,
      onSave: _handleSave,
      pilihSemua:
          _state.entries.map((e) => e.value.value).reduce((a, b) => a && b),
      items: _state.entries
          .map(
            (e) => CheckBoxItem(
              onChange: (v) => _handleChange(v, e.key),
              value: e.value.value,
              title: e.key,
            ),
          )
          .toList(),
    );
  }
}
