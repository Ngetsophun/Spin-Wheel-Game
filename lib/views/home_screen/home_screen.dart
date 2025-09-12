import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/gradient_text.dart';
import '../../utils/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 10,
            right: 10,
            child: ZoomTapAnimation(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'CanaPoints',
                          style: TextStyles.bodyReg20,
                          gradient: LinearGradient(
                            colors: [orange3, orange4],
                          ),
                        ),
                        GradientText(
                          'Last Spin : Sep 12 ,2025,at 5:05 PM',
                          style: TextStyles.bodyReg10,
                          gradient: LinearGradient(
                            colors: [orange3, orange4],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
