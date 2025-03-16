import 'package:flutter/material.dart';

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
                      Text('Hello,', style: TextStyle(fontSize: 18, color: Colors.black54)),
                      Text('Welcome to Afya Connect', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person, color: Colors.blue, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    Icon(Icons.search, color: Colors.grey),
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
              const SizedBox(height: 30),

              // Quick Access Features
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _FeatureCard(
                    icon: Icons.local_hospital,
                    label: 'Clinics',
                    color: Colors.blueAccent,
                    onTap: () {}, // Add navigation logic
                  ),
                  _FeatureCard(
                    icon: Icons.local_pharmacy,
                    label: 'Pharmacies',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  _FeatureCard(
                    icon: Icons.calendar_today,
                    label: 'Appointments',
                    color: Colors.orange,
                    onTap: () {},
                  ),
                  _FeatureCard(
                    icon: Icons.chat,
                    label: 'Chatbot',
                    color: Colors.purple,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Suggested Clinics/Pharmacies Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Suggested for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 16),

              // Suggested Cards
              SizedBox(
                height: size.height * 0.25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _SuggestionCard(
                      title: 'Green Valley Clinic',
                      subtitle: '24/7 Open',
                      icon: Icons.local_hospital,
                    ),
                    _SuggestionCard(
                      title: 'HealthPlus Pharmacy',
                      subtitle: 'Open until 10 PM',
                      icon: Icons.local_pharmacy,
                    ),
                    _SuggestionCard(
                      title: 'City Care Clinic',
                      subtitle: 'Specialist Available',
                      icon: Icons.local_hospital,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quick Feature Card Widget
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
            radius: 30,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// Suggested Clinic/Pharmacy Card Widget
class _SuggestionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SuggestionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade50,
            child: Icon(icon, color: Colors.blue, size: 28),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
            ],
          )
        ],
      ),
    );
  }
}
