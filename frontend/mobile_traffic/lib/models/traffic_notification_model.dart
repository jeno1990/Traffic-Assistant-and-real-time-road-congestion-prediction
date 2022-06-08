class TrafficNotification {
  TrafficNotification( this.violationType,  this.plateNumber, this. details);
  late String violationType;
  late String details;
  late String plateNumber;

  factory TrafficNotification.fromJson(Map<String, dynamic> data) {
    final violationType = data['violationType'] as String; // cast as non-nullable String
    final plateNumber = data['plateNumber'] as String; // cast as non-nullable String
    final details = data['details'] as String; // cast as nullable int
    return TrafficNotification( violationType, plateNumber, details);
  }
}