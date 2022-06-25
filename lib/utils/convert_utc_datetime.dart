DateTime convertUtcDatetime(DateTime utcTime) {
  final localTime = utcTime.toLocal();

  return localTime.subtract(Duration(
      days: localTime.day - utcTime.day, hours: localTime.hour - utcTime.hour));
}
