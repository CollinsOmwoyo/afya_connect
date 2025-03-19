import 'package:flutter/material.dart';

import '../core/services/csv_service.dart';
import '/models/clinic.dart';

class ClinicProvider with ChangeNotifier {
  final CsvService _csvService = CsvService();
  List<Clinic> _clinics = [];

  List<Clinic> get clinics => _clinics;

  ClinicProvider() {
    loadClinics();
  }

  Future<void> loadClinics() async {
    _clinics = await _csvService.loadClinics();
    notifyListeners();
  }
}
