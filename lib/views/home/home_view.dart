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
                    onTap: () {},
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

              // Suggested Cards (Empty, to be populated from CSV later)
              SizedBox(
                height: size.height * 0.22, // Reduced height for better fit
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Placeholder card widget for dynamic data
                    _EmptySuggestionCard(),
                    _EmptySuggestionCard(),
                    _EmptySuggestionCard(),
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

// Empty Placeholder for Suggestion Cards (For Dynamic Data Injection Later)
class _EmptySuggestionCard extends StatelessWidget {
  const _EmptySuggestionCard();

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
      child: Center(
        child: Text(
          'No Data Yet',
          style: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}

