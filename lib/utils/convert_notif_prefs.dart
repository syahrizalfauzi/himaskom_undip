Map<String, bool> statePrefsFromStoredPrefs(Map<String, bool> map) {
  return {
    'Umum': map['0']!,
    'Event': map['1']! && map['2']! && map['3']!,
    'Sistore': map['4']!,
    'Beasiswa': map['5']!,
    'Prestasi': map['6']!,
    'Akademik': map['7']!,
    'Karir': map['8']! && map['9']!,
    'Lomba': map['10']! && map['11']!,
  };
}

Map<String, bool> storedPrefsFromStatePrefs(Map<String, bool> map) {
  return {
    '0': map['Umum'] ?? false,
    '1': map['Event'] ?? false,
    '2': map['Event'] ?? false,
    '3': map['Event'] ?? false,
    '4': map['Sistore'] ?? false,
    '5': map['Beasiswa'] ?? false,
    '6': map['Prestasi'] ?? false,
    '7': map['Akademik'] ?? false,
    '8': map['Karir'] ?? false,
    '9': map['Karir'] ?? false,
    '10': map['Lomba'] ?? false,
    '11': map['Lomba'] ?? false,
  };
}
