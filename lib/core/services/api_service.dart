import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/clinic.dart';

class CsvService {
  Future<List<Clinic>> loadClinics() async {
    return _loadCsv('assets/data/clinics.csv');
  }

  Future<List<Clinic>> loadPharmacies() async {
    return _loadCsv('assets/data/pharmacies.csv');
  }

  Future<List<Clinic>> _loadCsv(String path) async {
    final csvString = await rootBundle.loadString(path);
    final rows = const CsvToListConverter().convert(csvString, eol: "\n");

    // Skip the first row (header)
    return rows.skip(1).map((row) => Clinic.fromCsv(row)).toList();
  }
}
