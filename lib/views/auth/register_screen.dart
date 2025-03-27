import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For external links

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  // Example URLs: Replace with your actual links.
  final String deployedAppUrl = 'https://yourdeployedapp.com';
  final String githubUrl = 'https://github.com/yourusername/afya_connect';
  final String linkedInUrl = 'https://www.linkedin.com/in/yourprofile';
  final String twitterUrl = 'https://twitter.com/yourprofile';
  final String youtubeDemoUrl = 'https://youtu.be/yourvideolink';

  // Helper to open external URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // For navigation header, you might use a Row with TextButtons to scroll to sections.
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Intro Section
            Stack(
              children: [
                // Large Cover Image
                Image.network(
                  'https://via.placeholder.com/1200x400?text=Cover+Image',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                // Semi-transparent overlay with header and title info
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black.withOpacity(0.4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header navigation
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Scroll to Feature Section, for example
                              },
                              child: const Text(
                                'Features',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Scroll to About Section
                              },
                              child: const Text(
                                'About',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Project Title & Tagline
                        const Text(
                          'Afya Connect',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Connecting you to healthcare, one click at a time.',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                          ),
                          onPressed: () => _launchURL(deployedAppUrl),
                          child: const Text('Visit App'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Feature Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    'Key Features',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  // Features: Clinics, Pharmacies, Appointments
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _FeatureCard(
                        icon: Icons.local_hospital,
                        title: 'Clinics',
                        description: 'Find nearby clinics with ease.',
                        color: Colors.teal,
                      ),
                      _FeatureCard(
                        icon: Icons.local_pharmacy,
                        title: 'Pharmacies',
                        description: 'Locate pharmacies and available medications.',
                        color: Colors.deepPurple,
                      ),
                      _FeatureCard(
                        icon: Icons.calendar_today,
                        title: 'Appointments',
                        description: 'Schedule and manage your healthcare appointments.',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // About Section
            Container(
              color: Colors.grey.shade200,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Afya Connect',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Afya Connect was inspired by the need for a seamless digital healthcare experience. '
                    'As a passionate developer and a graduate in Software Engineering, I embarked on this journey '
                    'to bridge the gap between patients and healthcare providers. This project is part of my portfolio for ALX. '
                    'I believe technology has the power to transform the way we access healthcare, and this app is my contribution to that change.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  // Social links and GitHub repository
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => _launchURL(linkedInUrl),
                        icon: const Icon(Icons.link, color: Colors.blue),
                        tooltip: 'LinkedIn',
                      ),
                      IconButton(
                        onPressed: () => _launchURL(githubUrl),
                        icon: const Icon(Icons.code, color: Colors.black),
                        tooltip: 'GitHub',
                      ),
                      IconButton(
                        onPressed: () => _launchURL(twitterUrl),
                        icon: const Icon(Icons.alternate_email, color: Colors.lightBlue),
                        tooltip: 'Twitter',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () => _launchURL(githubUrl),
                      child: const Text(
                        'View Project on GitHub',
                        style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Optional Advanced: YouTube Demo Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () => _launchURL(youtubeDemoUrl),
                icon: const Icon(Icons.play_circle_fill),
                label: const Text('Watch Demo Video'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
