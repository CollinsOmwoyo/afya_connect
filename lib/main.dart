import 'package:afya_connect/providers/clinic_provider.dart';
import 'package:afya_connect/providers/pharmacy_provider.dart';
import 'package:afya_connect/views/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClinicProvider()),
        ChangeNotifierProvider(create: (context) => PharmacyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afya Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const RegisterScreen(),
    );
  }
}
