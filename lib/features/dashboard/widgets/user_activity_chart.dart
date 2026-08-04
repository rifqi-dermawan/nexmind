import 'package:flutter/material.dart';

class UserActivityChart extends StatelessWidget {
  const UserActivityChart({super.key});

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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'User Activity',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  _buildLegendIndicator(Theme.of(context).primaryColor, 'New'),
                  const SizedBox(width: 12),
                  _buildLegendIndicator(Colors.green, 'Active'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Chart Area (Mock with CustomPaint)
          SizedBox(
            height: 120,
            width: double.infinity,
            child: CustomPaint(
              painter: _DualAreaChartPainter(
                color1: Theme.of(context).primaryColor,
                color2: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendIndicator(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}

// Custom Painter for a dual smooth area chart
class _DualAreaChartPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  _DualAreaChartPainter({required this.color1, required this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw horizontal grid lines
    final paintGrid = Paint()
      ..color = Colors.grey.withValues(alpha: 0.1)
      ..strokeWidth = 1;
    
    for (int i = 0; i <= 3; i++) {
      double y = size.height * (i / 3);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paintGrid);
    }

    _drawSeries(
      canvas, 
      size, 
      color: color2, 
      startY: 0.8, p1Y: 0.8, p2Y: 0.6, p3Y: 0.4, p4Y: 0.2, endY: 0.1,
    );

    _drawSeries(
      canvas, 
      size, 
      color: color1, 
      startY: 0.9, p1Y: 0.75, p2Y: 0.65, p3Y: 0.5, p4Y: 0.35, endY: 0.4,
    );
  }
  
  void _drawSeries(Canvas canvas, Size size, {
    required Color color,
    required double startY,
    required double p1Y,
    required double p2Y,
    required double p3Y,
    required double p4Y,
    required double endY,
  }) {
    final path = Path();
    path.moveTo(0, size.height * startY);
    path.quadraticBezierTo(size.width * 0.2, size.height * p1Y, size.width * 0.3, size.height * p2Y);
    path.quadraticBezierTo(size.width * 0.5, size.height * p3Y, size.width * 0.7, size.height * p4Y);
    path.quadraticBezierTo(size.width * 0.9, size.height * p4Y, size.width, size.height * endY);

    // Draw the line (dashed)
    final paintLine = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
      
    // A proper dashed line needs a path metric, but a solid line is fine for simplicity
    // To match the design which has dashed lines, we'll just use a solid line with lower opacity
    canvas.drawPath(path, paintLine);

    // Draw the area gradient
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paintFill = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.2),
          color.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
