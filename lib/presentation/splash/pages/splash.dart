import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:spotify_main_project/presentation/splash/intro/pages/get_startedpage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Enhanced background gradient with more vibrant colors
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF4422AA), // Vibrant middle color
              Color(0xFF16213E),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             TweenAnimationBuilder<double>(
  tween: Tween<double>(begin: 0.0, end: 1.0),
  duration: const Duration(seconds: 4),
  curve: Curves.easeInOut,
  onEnd: () {
    // Navigate to GetStarted page when animation completes
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const GetStartedpage()),
    );
  },
  builder: (context, value, child) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow background effect
        Container(
          width: 280 * value,
          height: 280 * value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF7700FF).withOpacity(0.3 * value),
                blurRadius: 30,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
                      
                      // Outer sound wave with rotation
                      Transform.rotate(
                        angle: value * math.pi / 4,
                        child: AnimatedSoundWave(
                          size: 240 * (0.8 + 0.2 * math.sin(value * math.pi * 2)),
                          opacity: 0.4 * value,
                          colors: const [Color(0xFFBB66FF), Color(0xFF8800FF)],
                        ),
                      ),
                      
                      // Middle sound wave with opposite rotation
                      Transform.rotate(
                        angle: -value * math.pi / 5,
                        child: AnimatedSoundWave(
                          size: 200 * (0.8 + 0.2 * math.sin(value * math.pi * 3)),
                          opacity: 0.5 * value,
                          colors: const [Color(0xFFAA44FF), Color(0xFF6600DD)],
                        ),
                      ),
                      
                      // Inner sound wave
                      Transform.rotate(
                        angle: value * math.pi / 6,
                        child: AnimatedSoundWave(
                          size: 160 * (0.8 + 0.2 * math.sin(value * math.pi * 4)),
                          opacity: 0.6 * value,
                          colors: const [Color(0xFF9933FF), Color(0xFF5500BB)],
                        ),
                      ),
                      
                      // Floating particles effect
                      ...List.generate(12, (index) {
                        final angle = index * math.pi / 6;
                        final distance = 120 * (0.5 + 0.5 * math.sin(value * math.pi * 2 + index));
                        return Positioned(
                          left: 120 + distance * math.cos(angle + value * math.pi),
                          top: 120 + distance * math.sin(angle + value * math.pi),
                          child: Opacity(
                            opacity: value * 0.9,
                            child: Container(
                              width: 8 + (index % 3) * 2,
                              height: 8 + (index % 3) * 2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: index % 3 == 0 
                                        ? Colors.purple.withOpacity(0.9) 
                                        : Colors.blue.withOpacity(0.9),
                                    blurRadius: 12,
                                    spreadRadius: 3,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                      
                      // Ripple effect
                      ...List.generate(3, (index) {
                        if (value < 0.3 + index * 0.2) return const SizedBox.shrink();
                        
                        final rippleValue = math.min(1.0, (value - (0.3 + index * 0.2)) * 3);
                        
                        return Opacity(
                          opacity: (1 - rippleValue) * 0.3,
                          child: Container(
                            width: 120 + 120 * rippleValue,
                            height: 120 + 120 * rippleValue,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3 * (1 - rippleValue),
                              ),
                            ),
                          ),
                        );
                      }),
                      
                      // Lyra Logo with bounce and rotate effect
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: const Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        builder: (context, scaleValue, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.scale(
                              scale: scaleValue,
                              child: Transform.rotate(
                                angle: (1 - scaleValue) * math.pi,
                                child: const EnhancedLyraLogo(size: 120),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              
              // Animated tagline with typing effect
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  const tagline = "Where Beats Meet Emotion🎧";
                  final visibleCharacters = (tagline.length * value).ceil();
                  final visibleText = tagline.substring(0, visibleCharacters);
                  
                  return Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Text with glow effect
                          Text(
                            visibleText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  color: Colors.purple,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                          
                          // Blinking cursor effect
                          if (visibleCharacters < tagline.length)
                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0.0, end: 1.0),
                              duration: const Duration(milliseconds: 500),
                              builder: (context, cursorValue, child) {
                                return Opacity(
                                  opacity: cursorValue < 0.5 ? 1.0 : 0.0,
                                  child: const Text(
                                    "|",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                      
                      // Animated underline with glow
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 2,
                        width: 200 * value,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.blue],
                          ),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.5),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              
              // Fade-in version indicator
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeIn,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: math.max(0, value - 0.7) * 3.3,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20),
                      // child: Text(
                      //   "v1.0.0",
                      //   style: TextStyle(
                      //     color: Colors.white70,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSoundWave extends StatelessWidget {
  final double size;
  final double opacity;
  final List<Color> colors;

  const AnimatedSoundWave({
    super.key, 
    required this.size, 
    required this.opacity,
    this.colors = const [Colors.purple, Colors.deepPurple],
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              colors[0].withOpacity(0.7),
              colors[1].withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}

class EnhancedLyraLogo extends StatelessWidget {
  final double size;
  
  const EnhancedLyraLogo({super.key, required this.size});
  
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.92, end: 1.08),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: EnhancedLyraLogoPainter(),
            ),
          ),
        );
      },
    );
  }
}

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
    
    // Subtle circle accent
    final Paint accentPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.purple.withOpacity(0.3)
      ..strokeWidth = 2.5;
    
    canvas.drawCircle(Offset(centerX, centerY), radius * 0.85, accentPaint);
    
    // Music note with gradient
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
    
    // Enhanced note head
    final double noteHeadRadius = radius * 0.28;
    final double noteHeadX = centerX + radius * 0.15;
    final double noteHeadY = centerY + radius * 0.3;
    
    // Add shadow to note head
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    
    canvas.drawCircle(
      Offset(noteHeadX + 2, noteHeadY + 2),
      noteHeadRadius,
      shadowPaint,
    );
    
    // Draw note head with gradient
    canvas.drawCircle(Offset(noteHeadX, noteHeadY), noteHeadRadius, notePaint);
    
    // Add highlight to note head
    final Paint highlightPaint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(
      Offset(noteHeadX - noteHeadRadius * 0.3, noteHeadY - noteHeadRadius * 0.3),
      noteHeadRadius * 0.3,
      highlightPaint,
    );
    
    // Note stem with shadow
    final double stemStartX = noteHeadX + noteHeadRadius * 0.8;
    final double stemStartY = noteHeadY - noteHeadRadius * 0.3;
    final double stemEndX = stemStartX;
    final double stemEndY = centerY - radius * 0.45;
    
    // Stem shadow
    final Paint stemShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = noteHeadRadius * 0.6;
    
   canvas.drawLine(
      Offset(stemStartX + 2, stemStartY + 2),
      Offset(stemEndX + 2, stemEndY + 2),
      stemShadowPaint,
    );
    
    // Actual stem with gradient
    final Paint stemPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFAA44FF), Color(0xFF6600CC)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(
        stemStartX - 5,
        stemEndY,
        10,
        stemStartY - stemEndY,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = noteHeadRadius * 0.6
      ..strokeCap = StrokeCap.round;
    
    canvas.drawLine(
      Offset(stemStartX, stemStartY),
      Offset(stemEndX, stemEndY),
      stemPaint,
    );
    
    // Enhanced note flag with curve
    final Path flagPath = Path();
    flagPath.moveTo(stemEndX, stemEndY);
    
    // More elegant curve for the flag
    flagPath.cubicTo(
      stemEndX + radius * 0.45,  // control point 1 x - more pronounced
      stemEndY + radius * 0.05,  // control point 1 y
      stemEndX + radius * 0.35,  // control point 2 x - more pronounced
      stemEndY + radius * 0.25,  // control point 2 y
      stemEndX + radius * 0.15,  // end point x - more pronounced
      stemEndY + radius * 0.35,  // end point y
    );
    
    // Add a second curve for more musical style
    flagPath.cubicTo(
      stemEndX + radius * 0.10,  // control point 1 x
      stemEndY + radius * 0.28,  // control point 1 y
      stemEndX - radius * 0.02,  // control point 2 x
      stemEndY + radius * 0.24,  // control point 2 y
      stemEndX,                  // end point x
      stemEndY + radius * 0.2,   // end point y
    );
    
    // Flag shadow
    final Paint flagShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    
    final Path flagShadowPath = Path()..addPath(flagPath, const Offset(2, 2));
    canvas.drawPath(flagShadowPath, flagShadowPaint);
    
    // Actual flag with gradient
    final Paint flagPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFAA44FF), Color(0xFF6600CC)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(
        stemEndX,
        stemEndY,
        radius * 0.4,
        radius * 0.35,
      ))
      ..style = PaintingStyle.fill;
    
    canvas.drawPath(flagPath, flagPaint);
    
    // Draw "LYRA" text with improved visibility
    // Background for better text visibility
    final textBackgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    final double textWidth = 68;
    final double textHeight = 24;
    final double textY = centerY - radius * 0.05;
    
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, textY),
          width: textWidth,
          height: textHeight,
        ),
        const Radius.circular(12),
      ),
      textBackgroundPaint,
    );
    
    // Draw "LYRA" text with stronger contrast and larger size
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'LYRA',
        style: TextStyle(
          foreground: Paint()
            ..shader = const LinearGradient(
              colors: [Color(0xFF6600CC), Color(0xFFAA44FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(Rect.fromLTWH(
              centerX - 40,
              textY - 10,
              80,
              20,
            )),
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    
    // Text shadow for depth
    final shadowTextPainter = TextPainter(
      text: const TextSpan(
        text: 'LYRA',
        style: TextStyle(
          color: Colors.black26,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    
    shadowTextPainter.layout();
    shadowTextPainter.paint(
      canvas, 
      Offset(centerX - shadowTextPainter.width / 2 + 2, textY - shadowTextPainter.height / 2 + 2),
    );
    
    textPainter.layout();
    textPainter.paint(
      canvas, 
      Offset(centerX - textPainter.width / 2, textY - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}