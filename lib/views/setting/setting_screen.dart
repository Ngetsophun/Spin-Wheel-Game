import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/gradient_text.dart';
import '../../utils/style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<int> slices = [0]; // store slices

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),

          /// Content
          Positioned.fill(
            top: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Wheel Name',
                    style: TextStyles.bodyReg24,
                    textAlign: TextAlign.center,
                    gradient: LinearGradient(colors: [orange3, orange4]),
                  ),
                  const SizedBox(height: 10),

                  /// Wheel Name TextField
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 16,
                        color: orange3,
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: orange3,
                      decoration: InputDecoration(
                        hintText: "Wheel Name",
                        hintStyle: TextStyles.bodyReg16,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Dynamic List of Slices
                  Expanded(
                    child: ListView.builder(
                      itemCount: slices.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: orange3,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          cursorColor: orange3,
                                          decoration: InputDecoration(
                                            hintText: "Title Name",
                                            hintStyle: TextStyles.bodyReg16,
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 15),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: orange3,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          cursorColor: orange3,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          decoration: InputDecoration(
                                            hintText: "Percent",
                                            hintStyle: TextStyles.bodyReg16,
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 15),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ZoomTapAnimation(
                                onTap: () {
                                  setState(() {
                                    slices.removeAt(index);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Add Wheel Slice (bottom right)
          Positioned(
            bottom: 90,
            right: 20,
            child: ZoomTapAnimation(
              onTap: () {
                setState(() {
                  slices.add(slices.length);
                });
              },
              child: GradientText(
                'Add Wheel Slice',
                style: TextStyles.bodyReg16,
                gradient: LinearGradient(colors: [orange3, orange4]),
              ),
            ),
          ),

          /// Create Wheel (bottom center)
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ZoomTapAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: GradientText(
                      'Create Wheel',
                      style: TextStyles.bodyReg20,
                      gradient: LinearGradient(colors: [orange3, orange4]),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Back button (top right)
          Positioned(
            top: 70,
            right: 10,
            child: ZoomTapAnimation(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 8),
                  child: GradientText(
                    'Back',
                    style: TextStyles.bodyReg20,
                    gradient: LinearGradient(colors: [orange3, orange4]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
