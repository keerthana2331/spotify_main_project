import 'package:flutter/material.dart';
import 'package:spotify_main_project/common/widgets/button/basic_app_button.dart';
import 'package:spotify_main_project/core/configs/theme/app_colors.dart';
import 'package:spotify_main_project/presentation/splash/pages/splash.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          _buildBackground(),
          
          // Content overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  _buildLogo(),
                  _buildAppName(),
                  const Spacer(),
                  _buildContentCard(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Background image widget
  Widget _buildBackground() {
    return Image.asset(
      'assets/images/intro_bg.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  // Logo widget
  Widget _buildLogo() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: EnhancedLyraLogoPainter(),
      ),
    );
  }

  // App name with glow effect
  Widget _buildAppName() {
    return const Text(
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
    );
  }

  // Main content card with description and button
  Widget _buildContentCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildHeading(),
          const SizedBox(height: 21),
          _buildDescription(),
          const SizedBox(height: 30),
          _buildGetStartedButton(context),
        ],
      ),
    );
  }

  // Heading text
  Widget _buildHeading() {
    return const Text(
      'Enjoy Listening To Music',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Description text
  Widget _buildDescription() {
    return const Text(
      "Dive into a world of endless melodies with Lyra Music. Whether you're vibing to your favorite tunes or discovering new beats, we bring music closer to you. Just hit play and let the rhythm take over!",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 15,
        height: 1.5,
      ), 
      textAlign: TextAlign.center,
    );
  }

  // Get Started button
  Widget _buildGetStartedButton(BuildContext context) {
    return LyraButton(
      onPressed: () {
        // Add navigation logic here
        // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
      },
      title: 'Get Started',
    );
  }
}

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