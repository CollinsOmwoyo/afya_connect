class Clinic {
  final int objectId;
  final String name;
  final String type;
  final String owner;
  final String county;
  final double latitude;
  final double longitude;

  Clinic ({
    required this.objectId,
    required this.name,
    required this.type,
    required this.owner,
    required this.county,
    required this.latitude,
    required this.longitude,
  });

  // Factory method to parse a row from CSV
  factory Clinic.fromCsv(List<dynamic> row) {
    return Clinic(
      objectId: row[0] as int,  // OBJECTID
      name: row[1] as String,  // Facility_Name
      type: row[2] as String,  // Type
      owner: row[3] as String, // Owner
      county: row[4] as String, // County
      latitude: double.tryParse(row[5].toString()) ?? 0.0, // Latitude
      longitude: double.tryParse(row[6].toString()) ?? 0.0, // Longitude
    );
  }
}
