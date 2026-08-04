import 'package:flutter/material.dart';

class ConversionOverviewChart extends StatelessWidget {
  const ConversionOverviewChart({super.key});

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
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Conversion Overview',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.more_horiz, size: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Filters
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFilterChip(context, '7D', false),
                _buildFilterChip(context, '30D', true),
                _buildFilterChip(context, '90D', false),
                _buildFilterChip(context, '1Y', false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Chart Area (Mock with CustomPaint)
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CustomPaint(
              painter: _MultiLineChartPainter(
                color1: Theme.of(context).primaryColor, // Yellow top
                color2: Colors.green, // Middle green
                color3: Colors.red, // Bottom red
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class _MultiLineChartPainter extends CustomPainter {
  final Color color1;
  final Color color2;
  final Color color3;

  _MultiLineChartPainter({
    required this.color1, 
    required this.color2, 
    required this.color3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Top Yellow area with solid line
    _drawAreaLine(
      canvas, 
      size, 
      color: color1, 
      startY: 0.8, p1Y: 0.7, p2Y: 0.1, p3Y: 0.3, p4Y: 0.1, endY: 0.4,
      isDashed: false,
      fillAlpha: 0.2,
    );

    // Middle Green line (dashed in design)
    _drawAreaLine(
      canvas, 
      size, 
      color: color2, 
      startY: 0.9, p1Y: 0.85, p2Y: 0.6, p3Y: 0.65, p4Y: 0.8, endY: 0.6,
      isDashed: true,
      fillAlpha: 0.05,
    );
    
    // Bottom Red line (dashed in design)
    _drawAreaLine(
      canvas, 
      size, 
      color: color3, 
      startY: 0.95, p1Y: 0.92, p2Y: 0.9, p3Y: 0.88, p4Y: 0.95, endY: 0.93,
      isDashed: true,
      fillAlpha: 0.0,
    );
  }

  void _drawAreaLine(Canvas canvas, Size size, {
    required Color color,
    required double startY,
    required double p1Y,
    required double p2Y,
    required double p3Y,
    required double p4Y,
    required double endY,
    required bool isDashed,
    required double fillAlpha,
  }) {
    final path = Path();
    path.moveTo(0, size.height * startY);
    path.quadraticBezierTo(size.width * 0.2, size.height * p1Y, size.width * 0.3, size.height * p2Y);
    path.quadraticBezierTo(size.width * 0.5, size.height * p3Y, size.width * 0.7, size.height * p4Y);
    path.quadraticBezierTo(size.width * 0.9, size.height * p4Y, size.width, size.height * endY);

    final paintLine = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
      
    // A simple simulation for dashed line by lowering opacity if needed, 
    // or just drawing solid since real dashed paths require extra path logic.
    if (isDashed) {
      paintLine.color = color.withValues(alpha: 0.6);
    }
    
    canvas.drawPath(path, paintLine);

    if (fillAlpha > 0) {
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      final paintFill = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: fillAlpha),
            color.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      canvas.drawPath(path, paintFill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
