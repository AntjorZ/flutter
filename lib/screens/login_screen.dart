import 'package:flutter/material.dart';
import 'podcast_screen.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color tealBg = Color(0xFF12958E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tealBg,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Логотип + слоган
            const Text(
              'medinow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Meditate With Us!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 60),

            // Блок кнопок авторизации
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _AuthButton(
                    text: 'Sign in with Apple',
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    icon: Icons.apple,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  _AuthButton(
                    text: 'Continue with Email or Phone',
                    backgroundColor: const Color(0xFFCCF0EE),
                    textColor: Colors.black,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const PodcastScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue With Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 20,
                    child: Image.asset(
                      'assets/images/meditation.png',
                      height: 200,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.self_improvement,
                        size: 140,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 220,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


class _AuthButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final VoidCallback onTap;

  const _AuthButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 22),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
