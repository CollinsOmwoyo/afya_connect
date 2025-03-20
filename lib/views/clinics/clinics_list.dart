import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/clinic_provider.dart';

class ClinicsListScreen extends StatelessWidget {
  const ClinicsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clinicProvider = Provider.of<ClinicProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Clinics')),
      body: clinicProvider.clinics.isEmpty
          ? const Center(child: Text('No Clinics Available'))
          : ListView.builder(
              itemCount: clinicProvider.clinics.length,
              itemBuilder: (context, index) {
                final clinic = clinicProvider.clinics[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(clinic.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${clinic.type} • ${clinic.owner} • ${clinic.county}'),
                  ),
                );
              },
            ),
    );
  }
}
