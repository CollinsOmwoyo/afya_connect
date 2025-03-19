import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import '/models/clinic.dart';
import '/models/pharmacy.dart';

class CsvService {
  // Load clinics
  Future<List<Clinic>> loadClinics() async {
    final csvString = await rootBundle.loadString('assets/data/clinics.csv');
    final rows = const CsvToListConverter().convert(csvString, eol: "\n");

    // Skip header row, parse each row into a Clinic
    return rows.skip(1).map((row) => Clinic.fromCsv(row)).toList();
  }

  // Load pharmacies
  Future<List<Pharmacy>> loadPharmacies() async {
    final csvString = await rootBundle.loadString('assets/data/pharmacies.csv');
    final rows = const CsvToListConverter().convert(csvString, eol: "\n");

    // Skip header row, parse each row into a Pharmacy
    return rows.skip(1).map((row) => Pharmacy.fromCsv(row)).toList();
  }
}
