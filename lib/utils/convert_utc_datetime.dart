DateTime convertUtcDatetime(DateTime utcTime) {
  final localTime = utcTime.toLocal();

  return localTime.subtract(Duration(hours: localTime.hour - utcTime.hour));
}
