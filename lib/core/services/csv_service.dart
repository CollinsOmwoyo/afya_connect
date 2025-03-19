import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import '/models/clinic.dart';
import '/models/pharmacy.dart';

class CsvService {
  Future<List<Clinic>> loadClinics() async {
    return _loadCsv<Clinic>('assets/data/clinics.csv', (row) => Clinic.fromCsv(row));
  }

  Future<List<Pharmacy>> loadPharmacies() async {
    return _loadCsv<Pharmacy>('assets/data/pharmacies.csv', (row) => Pharmacy.fromCsv(row));
  }

  Future<List<T>> _loadCsv<T>(String path, T Function(List<dynamic>) fromCsv) async {
    try {
      final csvString = await rootBundle.loadString(path);
      final rows = const CsvToListConverter().convert(csvString, eol: "\n");

      if (rows.isEmpty) return [];

      return rows.skip(1).map((row) => fromCsv(row)).toList();
    } catch (e) {
      print("Error loading CSV at $path: $e");
      return [];
    }
  }
}
