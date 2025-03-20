import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/clinic_provider.dart';
import '/providers/pharmacy_provider.dart';
import '/views/appointments/appointments_screen.dart';
import '/views/clinics/clinics_list.dart';
import '/views/pharmacies/pharmacies_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting and Profile Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hello Collins Omwoyo,',
                          style: TextStyle(fontSize: 16, color: Colors.black54)),
                      Text('Welcome to Afya Connect',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person, color: Colors.blue, size: 26),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.purple),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search clinics, pharmacies, medications...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quick Access Features
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _FeatureCard(
                    icon: Icons.local_hospital,
                    label: 'Clinics',
                    color: Colors.teal,
                    onTap: () {
                      // Navigate to clinics list
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ClinicsListScreen()),
                      );
                    },
                  ),
                  _FeatureCard(
                    icon: Icons.local_pharmacy,
                    label: 'Pharmacies',
                    color: Colors.deepPurple,
                    onTap: () {
                      // Navigate to pharmacies list
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PharmaciesListScreen()),
                      );
                    },
                  ),
                  _FeatureCard(
                    icon: Icons.calendar_today,
                    label: 'Appointments',
                    color: Colors.orange,
                    onTap: () {
                      // Navigate to appointments
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AppointmentsScreen()),
                      );
                    },
                  ),
                  _FeatureCard(
                    icon: Icons.chat,
                    label: 'Chatbot',
                    color: Colors.purple,
                    onTap: () {
                      // Navigate to chatbot
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Suggested Clinics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Suggested Clinics',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Navigate to clinics list
                    },
                    child: const Text('See All', style: TextStyle(color: Colors.teal)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: size.height * 0.20,
                child: Consumer<ClinicProvider>(
                  builder: (context, clinicProvider, child) {
                    if (clinicProvider.clinics.isEmpty) {
                      return const Center(child: Text('No Clinics Available'));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: clinicProvider.clinics.length,
                      itemBuilder: (context, index) {
                        final clinic = clinicProvider.clinics[index];
                        return _DynamicSuggestionCard(
                          color: Colors.teal,
                          title: clinic.name,
                          subtitle: clinic.county,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Suggested Pharmacies Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Suggested Pharmacies',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Navigate to pharmacies list
                    },
                    child:
                        const Text('See All', style: TextStyle(color: Colors.deepPurple)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: size.height * 0.20,
                child: Consumer<PharmacyProvider>(
                  builder: (context, pharmacyProvider, child) {
                    if (pharmacyProvider.pharmacies.isEmpty) {
                      return const Center(child: Text('No Pharmacies Available'));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pharmacyProvider.pharmacies.length,
                      itemBuilder: (context, index) {
                        final pharmacy = pharmacyProvider.pharmacies[index];
                        return _DynamicSuggestionCard(
                          color: Colors.deepPurple,
                          title: pharmacy.name,
                          subtitle: pharmacy.county,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Quick Feature Card
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// Card widget for displaying dynamic suggestions from CSV data
class _DynamicSuggestionCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  const _DynamicSuggestionCard({
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text(subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}

