import 'package:flutter/material.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({super.key});

  @override
  State<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  final List<Offset?> _points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawing Pad')),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox? referenceBox = context.findRenderObject() as RenderBox?;
            final point = referenceBox?.globalToLocal(details.globalPosition);
            _points.add(point);
          });
        },
        onPanEnd: (_) => _points.add(null),
        child: CustomPaint(
          painter: _DrawingPainter(points: _points),
          size: Size.infinite,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _points.clear();
          });
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  _DrawingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
