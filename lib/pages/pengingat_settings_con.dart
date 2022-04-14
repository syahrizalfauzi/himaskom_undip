import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/pages/pengingat_settings_pres.dart';

class PengingatSettingsContainer extends HookWidget {
  const PengingatSettingsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _minute = useState(1440);

    _handleChange(int? value) => _minute.value = value ?? 1440;
    _handleSave() {
      Navigator.of(context).pop(_minute.value);
    }

    return PengingatSettingsPresentational(
      onChange: _handleChange,
      onSave: _handleSave,
      value: _minute.value,
    );
  }
}
