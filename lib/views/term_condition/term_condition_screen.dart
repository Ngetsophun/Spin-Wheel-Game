import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/gradient_text.dart';
import '../../utils/style.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({super.key});

  @override
  State<TermConditionScreen> createState() => _TermConditionScreenState();
}

class _TermConditionScreenState extends State<TermConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3), // dim background
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(
              color: Color(0xffb97f11),
              width: 3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GradientText(
                'Term & Condition',
                style: TextStyles.bodyReg20,
                gradient: LinearGradient(
                  colors: [orange3, orange4],
                ),
              ),
              const SizedBox(height: 12),

              Expanded(
                child: SingleChildScrollView(
                  child:  GradientText(
                    '''
1. Eligibility:
   - The Spin Wheel game is open to all registered users.
   - By playing, you agree to these Terms & Conditions.

2. How to Play:
   - Tap the SPIN button to start.
   - The wheel will stop randomly on a prize.

3. Prizes:
   - Prizes are final once awarded.
   - Prizes cannot be exchanged for cash unless stated.

4. Fair Play:
   - Each spin is random and cannot be influenced.
   - Any attempt to cheat may result in disqualification.

5. Limitations:
   - Each user may spin [once per day / X times per week].
   - The organizer can change or remove prizes at any time.

6. Liability:
   - We are not responsible for technical issues or device errors.
   - The organizer reserves the right to cancel or modify the game.

7. Acceptance:
   - By playing, you agree to these Terms & Conditions.
                    ''',
                    style: TextStyles.bodyReg16,
                    gradient: const LinearGradient(
                      colors: [orange3, orange4],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ZoomTapAnimation(
                key: const ValueKey('OkButton'),
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/images/ok_button_pressed.png',
                  width: 120,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
