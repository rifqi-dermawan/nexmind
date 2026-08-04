import 'package:flutter/material.dart';
import '../../shared/components/nexmind_top_bar.dart';
import '../../shared/components/nexmind_bottom_nav.dart';

class DesignPreviewScreen extends StatefulWidget {
  const DesignPreviewScreen({super.key});

  @override
  State<DesignPreviewScreen> createState() => _DesignPreviewScreenState();
}

class _DesignPreviewScreenState extends State<DesignPreviewScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NexmindTopBar(title: 'Design System Preview'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Typography', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text('Heading 1', style: Theme.of(context).textTheme.headlineLarge),
            Text('Heading 2', style: Theme.of(context).textTheme.headlineMedium),
            Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 32),
            Text('Buttons', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text('Primary Button')),
            const SizedBox(height: 8),
            OutlinedButton(onPressed: () {}, child: const Text('Outline Button')),
            const SizedBox(height: 32),
            Text('Cards', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Card Content', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NexmindBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
