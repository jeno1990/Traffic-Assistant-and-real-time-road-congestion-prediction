class TrafficNotification {
  TrafficNotification(this.violationType, this.plateNumber, this.details,
      this.longtuide, this.latitiude);
  late String violationType;
  late String details;
  late String plateNumber;
  late double longtuide;
  late double latitiude;

  factory TrafficNotification.fromJson(Map<String, dynamic> data) {
    final violationType =
        data['violationType'] as String; // cast as non-nullable String
    final plateNumber = data['plateNumber'] as String;
    final longtuide =
        data['longtuide'] as double; // cast as non-nullable String
    final latitiude =
        data['latitiude'] as double; // cast as non-nullable String
    final details = data['details'] as String; // cast as nullable int
    return TrafficNotification(
        violationType, plateNumber, details, longtuide, latitiude);
  }
}
