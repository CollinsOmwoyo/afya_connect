import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/appointment.dart';
import '/providers/clinic_provider.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _specialists = ['General Physician', 'Pediatrician', 'Dermatologist', 'Dentist'];
  String? _selectedSpecialist;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  List<Appointment> _appointments = [];

  @override
  Widget build(BuildContext context) {
    final clinicProvider = Provider.of<ClinicProvider>(context);
    final List clinics = clinicProvider.clinics
        .where((clinic) => clinic.name.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a clinic...',
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 10),

            // Search Results
            Expanded(
              child: clinics.isEmpty
                  ? const Center(child: Text('No clinics found'))
                  : ListView.builder(
                      itemCount: clinics.length,
                      itemBuilder: (context, index) {
                        final clinic = clinics[index];
                        return Card(
                          color: Colors.teal.shade100,
                          child: ListTile(
                            title: Text(clinic.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(clinic.county),
                            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
                            onTap: () => _showAppointmentDialog(context, clinic),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 20),

            // Pending Appointments
            const Text('Pending Appointments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: _appointments.isEmpty
                  ? const Center(child: Text('No pending appointments'))
                  : ListView.builder(
                      itemCount: _appointments.length,
                      itemBuilder: (context, index) {
                        final appointment = _appointments[index];
                        return Card(
                          color: Colors.purple.shade100,
                          child: ListTile(
                            title: Text('${appointment.clinicName} - ${appointment.specialist}'),
                            subtitle: Text(
                              'Date: ${appointment.date}, Time: ${appointment.time}',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => setState(() => _appointments.removeAt(index)),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Show Appointment Dialog
  void _showAppointmentDialog(BuildContext context, clinic) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Book an Appointment'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Select Specialist
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Specialist',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    value: _selectedSpecialist,
                    items: _specialists.map((specialist) {
                      return DropdownMenuItem(value: specialist, child: Text(specialist));
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedSpecialist = value),
                  ),
                  const SizedBox(height: 10),

                  // Select Date
                  ListTile(
                    title: Text(_selectedDate == null
                        ? 'Select Date'
                        : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                    leading: const Icon(Icons.calendar_today, color: Colors.teal),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) setState(() => _selectedDate = pickedDate);
                    },
                  ),

                  // Select Time
                  ListTile(
                    title: Text(_selectedTime == null
                        ? 'Select Time'
                        : 'Time: ${_selectedTime!.format(context)}'),
                    leading: const Icon(Icons.access_time, color: Colors.purple),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) setState(() => _selectedTime = pickedTime);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: () {
                    if (_selectedSpecialist != null && _selectedDate != null && _selectedTime != null) {
                      setState(() {
                        _appointments.add(Appointment(
                          clinicName: clinic.name,
                          specialist: _selectedSpecialist!,
                          date: _selectedDate!.toLocal().toString().split(' ')[0],
                          time: _selectedTime!.format(context),
                        ));
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Book'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
