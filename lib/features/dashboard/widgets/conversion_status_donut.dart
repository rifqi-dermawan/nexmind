import 'dart:math';
import 'package:flutter/material.dart';

class ConversionStatusDonut extends StatelessWidget {
  const ConversionStatusDonut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Conversion Status',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          
          Row(
            children: [
              // Donut Chart
              SizedBox(
                width: 120,
                height: 120,
                child: CustomPaint(
                  painter: _DonutChartPainter(),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '18.4k',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const SizedBox(width: 24),
              
              // Legend
              Expanded(
                child: Column(
                  children: const [
                    _LegendItem(color: Colors.green, label: 'Successful', count: '13.6k', percent: '74%'),
                    SizedBox(height: 8),
                    _LegendItem(color: Color(0xFFFFD54F), label: 'Pending', count: '1.6k', percent: '9%'),
                    SizedBox(height: 8),
                    _LegendItem(color: Colors.lightBlue, label: 'Processing', count: '920', percent: '5%'),
                    SizedBox(height: 8),
                    _LegendItem(color: Colors.red, label: 'Failed', count: '2.2k', percent: '12%'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String count;
  final String percent;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.count,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Text(
          count,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 24,
          child: Text(
            percent,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const strokeWidth = 16.0;
    
    // Draw background circle (optional, but good for gaps)
    final bgPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.1)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(rect.center, size.width / 2 - strokeWidth / 2, bgPaint);

    double startAngle = -pi / 2; // Start from top
    
    void drawArc(Color color, double percentage) {
      final sweepAngle = 2 * pi * percentage;
      final paint = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round; // To match design with rounded segments if needed
        
      canvas.drawArc(
        Rect.fromCircle(center: rect.center, radius: size.width / 2 - strokeWidth / 2),
        startAngle,
        sweepAngle - 0.1, // Small gap between segments
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    drawArc(Colors.green, 0.74);
    drawArc(const Color(0xFFFFD54F), 0.09);
    drawArc(Colors.lightBlue, 0.05);
    drawArc(Colors.red, 0.12);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
