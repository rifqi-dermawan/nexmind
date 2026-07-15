import 'package:flutter/material.dart';

class SettingsAttachmentCard extends StatefulWidget {
  const SettingsAttachmentCard({super.key});

  @override
  State<SettingsAttachmentCard> createState() => _SettingsAttachmentCardState();
}

class _SettingsAttachmentCardState extends State<SettingsAttachmentCard> {
  bool _repeatTask = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.repeat, color: Colors.black87, size: 20),
                  SizedBox(width: 12),
                  Text(
                    'Repeat Task',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: _repeatTask,
                  onChanged: (val) {
                    setState(() {
                      _repeatTask = val;
                    });
                  },
                  activeColor: const Color(0xFF6B4E0F),
                  activeTrackColor: const Color(0xFFF1B000),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Colors.grey.shade200),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.color_lens_outlined, color: Colors.black87, size: 20),
                  SizedBox(width: 12),
                  Text(
                    'Color Tag',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFD54F),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Colors.grey.shade200),
          ),
          Row(
            children: const [
              Icon(Icons.attach_file, color: Colors.black87, size: 20),
              SizedBox(width: 12),
              Text(
                'Attachments',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Dashed border container approximation
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5,
                // Flutter doesn't have native dashed borders easily without a package, 
                // so we use a solid thin border with a light color for a clean look, 
                // or we could use CustomPaint, but standard border is safer for now.
              ),
            ),
            child: Column(
              children: const [
                Icon(Icons.upload_outlined, color: Colors.black87, size: 28),
                SizedBox(height: 8),
                Text(
                  'Upload file or image',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
