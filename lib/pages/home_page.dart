import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'drawing_page.dart';
import 'clock_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiddo Works'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _ToolButton(
            icon: Icons.calculate,
            label: 'Calculator',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CalculatorPage()),
              );
            },
          ),
          _ToolButton(
            icon: Icons.brush,
            label: 'Drawing Pad',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DrawingPage()),
              );
            },
          ),
          _ToolButton(
            icon: Icons.access_time,
            label: 'Clock',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ClockPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ToolButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.orangeAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 64, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
