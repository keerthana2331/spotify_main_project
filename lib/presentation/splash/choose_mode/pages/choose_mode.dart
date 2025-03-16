import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style for better immersion
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Enhanced background image
          _buildEnhancedBackground(),
          
          // Gradient overlay for better readability
          _buildGradientOverlay(),
          
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  _buildPageTitle(),
                  const SizedBox(height: 60),
                  _buildThemeOptions(),
                  const Spacer(),
                  _buildDescription(),
                  const SizedBox(height: 40),
                  _buildContinueButton(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Enhanced background
  Widget _buildEnhancedBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/choose_mode_bg.png'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  // Gradient overlay
  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.85),
          ],
          stops: const [0.0, 0.65, 1.0],
        ),
      ),
    );
  }

  // Page title
  Widget _buildPageTitle() {
    return const Column(
      children: [
        Text(
          "CHOOSE YOUR THEME",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Personalize your listening experience",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Theme selection options
  Widget _buildThemeOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Light Mode Option
        _buildThemeCard(
          title: "LIGHT MODE",
          icon: Icons.light_mode_rounded,
          description: "Bright & clear interface",
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFE0E0FF)],
          ),
          iconColor: const Color(0xFFFFA726),
          textColor: Colors.black87,
          shadowColor: Colors.white.withOpacity(0.5),
        ),
        
        const SizedBox(width: 20),
        
        // Dark Mode Option
        _buildThemeCard(
          title: "DARK MODE",
          icon: Icons.dark_mode_rounded,
          description: "Easy on the eyes",
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2B2B3D), Color(0xFF1A1A2E)],
          ),
          iconColor: const Color(0xFFBB86FC),
          textColor: Colors.white,
          shadowColor: const Color(0xFF6600CC).withOpacity(0.4),
          isSelected: true,
        ),
      ],
    );
  }

  // Individual theme card
  Widget _buildThemeCard({
    required String title,
    required IconData icon,
    required String description,
    required LinearGradient gradient,
    required Color iconColor,
    required Color textColor,
    required Color shadowColor,
    bool isSelected = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Theme selection logic would go here
        },
        child: Container(
          height: 220,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: isSelected ? const Color(0xFF9933FF) : Colors.transparent,
              width: 2.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Theme icon
              Icon(
                icon,
                size: 60,
                color: iconColor,
              ),
              const SizedBox(height: 20),
              // Theme title
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Theme description
              Text(
                description,
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Description text
  Widget _buildDescription() {
    return const Text(
      "Choose the theme that suits your style. You can always change this later in the settings.",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white70,
        fontSize: 16,
        height: 1.6,
      ), 
      textAlign: TextAlign.center,
    );
  }

  // Continue button
  Widget _buildContinueButton(BuildContext context) {
    return ContinueButton(
      onPressed: () {
        // Add navigation logic here
      },
    );
  }
}

// Enhanced continue button
class ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  
  const ContinueButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB347FF), Color(0xFF7C00FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7700FF).withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          splashColor: Colors.white.withOpacity(0.1),
          highlightColor: Colors.white.withOpacity(0.05),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "CONTINUE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}