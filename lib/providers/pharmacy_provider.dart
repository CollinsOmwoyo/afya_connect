import 'package:flutter/material.dart';
import '/models/pharmacy.dart';
import '/core/services/api_service.dart';

class PharmacyProvider with ChangeNotifier {
  final CsvService _csvService = CsvService();
  List<Pharmacy> _pharmacies = [];

  List<Pharmacy> get pharmacies => _pharmacies;

  PharmacyProvider() {
    loadPharmacies();
  }

  Future<void> loadPharmacies() async {
    _pharmacies = await _csvService.loadPharmacies();
    notifyListeners();
  }
}
