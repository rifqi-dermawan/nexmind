// lib/features/maintenance/maintenance_screen.dart
import 'package:flutter/material.dart';
import '../../shared/components/nexmind_top_bar.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NexmindTopBar(title: 'Maintenance'),
      body: Center(
        child: Text('Maintenance Screen Placeholder'),
      ),
    );
  }
}
