import 'package:flutter/material.dart';

class MaintenanceModeCard extends StatefulWidget {
  const MaintenanceModeCard({super.key});

  @override
  State<MaintenanceModeCard> createState() => _MaintenanceModeCardState();
}

class _MaintenanceModeCardState extends State<MaintenanceModeCard> {
  bool _isMaintenanceMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Maintenance Mode: ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  children: [
                    TextSpan(
                      text: _isMaintenanceMode ? 'Active' : 'Inactive',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _isMaintenanceMode,
                onChanged: (value) {
                  setState(() {
                    _isMaintenanceMode = value;
                  });
                },
                activeColor: const Color(0xFFFFCA28), // Nexmind yellow
                inactiveThumbColor: Theme.of(context).dividerColor,
                inactiveTrackColor: Colors.grey.shade400,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'This will restrict user access to the platform.',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isMaintenanceMode = !_isMaintenanceMode;
                });
              },
              icon: const Icon(Icons.power_settings_new, color: Colors.black87),
              label: Text(
                _isMaintenanceMode ? 'Disable Maintenance Mode' : 'Enable Maintenance Mode',
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFCA28), // Nexmind yellow
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
