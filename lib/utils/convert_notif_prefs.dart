Map<String, bool> prefsMapFromList(List<bool> list) {
  return {
    'Umum': list[0],
    'Event': list[1] && list[2] && list[3],
    'Sistore': list[4],
    'Beasiswa': list[5],
    'Prestasi': list[6],
    'Akademik': list[7],
    'Karir': list[8] && list[9],
    'Lomba': list[10] && list[11]
  };
}

Iterable<MapEntry<int, bool>> prefsEntriesFromMap(Map<String, bool> map) {
  return [
    MapEntry(0, map['Umum'] ?? false),
    MapEntry(1, map['Event'] ?? false),
    MapEntry(2, map['Event'] ?? false),
    MapEntry(3, map['Event'] ?? false),
    MapEntry(4, map['Sistore'] ?? false),
    MapEntry(5, map['Beasiswa'] ?? false),
    MapEntry(6, map['Prestasi'] ?? false),
    MapEntry(7, map['Akademik'] ?? false),
    MapEntry(8, map['Karir'] ?? false),
    MapEntry(9, map['Karir'] ?? false),
    MapEntry(10, map['Lomba'] ?? false),
    MapEntry(11, map['Lomba'] ?? false),
  ];
}
