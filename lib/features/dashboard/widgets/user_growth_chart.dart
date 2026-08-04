import 'package:flutter/material.dart';

class UserGrowthChart extends StatelessWidget {
  const UserGrowthChart({super.key});

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
            'User Growth',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          
          // Chart Area (Mock with CustomPaint)
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.05), // Light background like design
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomPaint(
                painter: _GrowthChartPainter(
                  color1: Colors.green, // Top line
                  color2: Theme.of(context).primaryColor, // Bottom line
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GrowthChartPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  _GrowthChartPainter({required this.color1, required this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    // We are drawing two ascending lines intersecting/overlapping
    _drawGrowthLine(
      canvas, 
      size, 
      color: color1, 
      startY: 0.9, endY: 0.2, 
      fillAlpha: 0.05,
    );

    _drawGrowthLine(
      canvas, 
      size, 
      color: color2, 
      startY: 0.95, endY: 0.35, 
      fillAlpha: 0.1,
    );
  }
  
  void _drawGrowthLine(Canvas canvas, Size size, {
    required Color color,
    required double startY,
    required double endY,
    required double fillAlpha,
  }) {
    final path = Path();
    path.moveTo(0, size.height * startY);
    // Smooth curve ascending
    path.quadraticBezierTo(size.width * 0.4, size.height * startY * 0.8, size.width, size.height * endY);

    final paintLine = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
      
    canvas.drawPath(path, paintLine);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final paintFill = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: fillAlpha * 2),
          color.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
