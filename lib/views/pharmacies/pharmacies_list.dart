import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/pharmacy_provider.dart';

class PharmaciesListScreen extends StatelessWidget {
  const PharmaciesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pharmacyProvider = Provider.of<PharmacyProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pharmacies')),
      body: pharmacyProvider.pharmacies.isEmpty
          ? const Center(child: Text('No Pharmacies Available'))
          : ListView.builder(
              itemCount: pharmacyProvider.pharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = pharmacyProvider.pharmacies[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(pharmacy.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${pharmacy.type} • ${pharmacy.owner} • ${pharmacy.county}'),
                  ),
                );
              },
            ),
    );
  }
}
