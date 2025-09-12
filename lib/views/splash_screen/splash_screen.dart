import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/gradient_text.dart';
import '../../utils/style.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double progress = 0;

  late AnimationController _controller;
  late Animation<double> _loadingFade;
  late Animation<double> _titleScale;

  @override
  void initState() {
    super.initState();

    /// 🔹 Setup Fade Animation for "Loading..."
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Blink effect

    _loadingFade = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);

    /// 🔹 Title bounce-in effect
    _titleScale = Tween<double>(
      begin: 0.8,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      setState(() {
        if (progress < 100) {
          progress++;
        } else {
          timer.cancel();
          _controller.dispose(); // Dispose animation when finished

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const backgroundUrl =
        "https://static.vecteezy.com/system/resources/previews/001/923/668/non_2x/casino-spinning-fortune-wheel-banner-template-vector.jpg";

    return Scaffold(
      body: Stack(
        children: [
          /// Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: GradientText(
              "Welcome To Cana Fortune Wheel",
              style: TextStyles.bodyReg40,
              gradient: const LinearGradient(colors: [orange3, orange4]),
            ),
            //child: Image.asset('assets/images/title.png',),
          ),

          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// 🔹 Animated "Loading..."
                    FadeTransition(
                      opacity: _loadingFade,
                      child: GradientText(
                        'Loading...',
                        style: TextStyles.bodyReg16,
                        gradient: const LinearGradient(
                          colors: [orange3, orange4],
                        ),
                      ),
                    ),

                    /// 🔹 Progress Percentage
                    GradientText(
                      "${progress.toInt()}%",
                      style: TextStyles.bodyReg16,
                      gradient: const LinearGradient(
                        colors: [orange3, orange4],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress / 100,
                  minHeight: 8,
                  backgroundColor: Colors.white,
                  color: Color(0xffb97f11),
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
