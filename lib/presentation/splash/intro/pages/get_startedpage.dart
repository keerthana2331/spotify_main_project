import 'package:flutter/material.dart';

import '../../choose_mode/pages/choose_mode.dart';


class GetStartedpage extends StatelessWidget {
  const GetStartedpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/intro_bg.png'),
              ),
            ),
          ),
          // Overlay gradient for better text visibility
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top section with logo
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CustomPaint(
                          painter: EnhancedLyraLogoPainter(),
                        ),
                      ),
                    ),
                  ),
                  
                  // App name text
                  const Text(
                    "LYRA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      shadows: [
                        Shadow(
                          color: Color(0xFF7700FF),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Main content at the bottom
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 21),
                  
                  const Text(
                    "Dive into a world of endless melodies with Lyra Music. Whether you're vibing to your favorite tunes or discovering new beats, we bring music closer to you. Just hit play and let the rhythm take over!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ), 
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 40),
                  
                // Custom styled button
LyraButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseMode()),
    );
  },
  title: 'Get Started',
),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom button with Lyra styling
class LyraButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  
  const LyraButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF9933FF), Color(0xFF6600CC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7700FF).withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

// Ensure you have the EnhancedLyraLogoPainter class defined or imported
class EnhancedLyraLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;
    
    // Enhanced outer glow effect
    final Paint glowPaint = Paint()
      ..color = Colors.purple.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18);
    
    canvas.drawCircle(Offset(centerX, centerY), radius * 1.15, glowPaint);
    
    // Background gradient circle
    final Paint circlePaint = Paint()
      ..shader = const RadialGradient(
        colors: [Colors.white, Color(0xFFF0F0FF)],
        stops: [0.7, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius,
      ));
    
    canvas.drawCircle(Offset(centerX, centerY), radius, circlePaint);
    
    // Add rest of the logo painting code here
    // (I've included a basic version to save space)
    
    // Music note
    final Paint notePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFAA44FF), Color(0xFF6600CC)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(
        centerX - radius / 2,
        centerY - radius / 2,
        radius,
        radius,
      ))
      ..style = PaintingStyle.fill;
    
    // Note head
    canvas.drawCircle(
      Offset(centerX + radius * 0.15, centerY + radius * 0.3),
      radius * 0.28,
      notePaint
    );
    
    // Note stem
    canvas.drawLine(
      Offset(centerX + radius * 0.35, centerY + radius * 0.2),
      Offset(centerX + radius * 0.35, centerY - radius * 0.45),
      Paint()
        ..color = const Color(0xFF6600CC)
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}