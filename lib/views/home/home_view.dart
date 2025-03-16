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
                      Text('Hello,', style: TextStyle(fontSize: 16, color: Colors.black54)),
                      Text('Welcome to Afya Connect', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    onTap: () {},
                  ),
                  _FeatureCard(
                    icon: Icons.local_pharmacy,
                    label: 'Pharmacies',
                    color: Colors.deepPurple,
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
              const SizedBox(height: 24),

              // Suggested Clinics
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Suggested Clinics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(color: Colors.teal)),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: size.height * 0.20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _SuggestionCard(color: Colors.teal),
                    _SuggestionCard(color: Colors.teal),
                    _SuggestionCard(color: Colors.teal),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Suggested Pharmacies
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Suggested Pharmacies', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(color: Colors.deepPurple)),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: size.height * 0.20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _SuggestionCard(color: Colors.deepPurple),
                    _SuggestionCard(color: Colors.deepPurple),
                    _SuggestionCard(color: Colors.deepPurple),
                  ],
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
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// Empty Placeholder for Suggestion Cards (Dynamic Data Ready)
class _SuggestionCard extends StatelessWidget {
  final Color color;

  const _SuggestionCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
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
      child: Center(
        child: Text(
          'No Data Yet',
          style: TextStyle(color: color.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

