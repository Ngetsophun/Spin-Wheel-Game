import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:spin_wheel_canadia/routes/config_router.dart';
import 'package:spin_wheel_canadia/views/home_screen/widget/custom_dialog_success.dart';
import 'package:spin_wheel_canadia/views/home_screen/widget/spin_button.dart';
import 'package:spin_wheel_canadia/views/setting/setting_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/gradient_text.dart';
import '../../utils/style.dart';
import '../term_condition/term_condition_screen.dart';

class SpinWheelScreen extends StatefulWidget {
  const SpinWheelScreen({super.key});
  @override
  State<SpinWheelScreen> createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  final StreamController<int> controller = StreamController<int>();
  int selected = 0;
  bool isSpinning = false;

  final prizes = ["200", "100", "50", "20", "10", "5", "1", "Try Again"];

  final AudioPlayer _player = AudioPlayer();

  Future<void> _playSpinSound() async {
    // Play the sound in loop
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(AssetSource('sounds/spinner_sound.mp3'));
  }

  Future<void> _playCongratsSound({int durationInSeconds = 3}) async {
    // Play congratulation sound
    await _player.play(AssetSource('sounds/congrate_sound.mp3'));

    // Stop automatically after duration
    Future.delayed(Duration(seconds: durationInSeconds), () async {
      await _player.stop();
    });
  }

  Future<void> _stopSpinSound() async {
    await _player.stop(); // stop the sound when spin ends
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        showDialog(
          context: context,
          barrierDismissible: false, // prevent closing by tapping outside
          builder: (context) => const TermConditionScreen(),
        );
      });
    });
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  ///=============== Function Spin Wheel ============
  Future<void> spinWheel() async {
    if (isSpinning) return;
    setState(() => isSpinning = true);
    _playSpinSound();
    final probability = [0, 1, 1, 1, 1, 2, 23, 70];

    ///=========================  Generate a random number based on probability
    selected = getRandomIndexByProbability(probability);
    controller.add(selected);

    Future.delayed(const Duration(seconds: 5), () async {
      setState(() => isSpinning = false); // 🔹 enable button again
      await _stopSpinSound(); // stop sound
      _playCongratsSound(durationInSeconds: 2);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => CustomDialogSuccess(
          onOk: () async {
            await _player.stop();
            Navigator.pop(context);
          },
          price: prizes[selected],
        ),
      );
    });
  }

  ///=================  Function to pick random index based on Probability
  int getRandomIndexByProbability(List<int> proBabs) {
    int total = proBabs.reduce((a, b) => a + b);
    int rnd = Random().nextInt(total);
    for (int i = 0; i < proBabs.length; i++) {
      if (rnd < proBabs[i]) return i;
      rnd -= proBabs[i];
    }
    return proBabs.length - 1; // fallback
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final wheelSize = screenWidth * 0.8;
    final adjustedWheelSize = screenWidth > 650 ? 520.0 : wheelSize;
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

          ///===================  🔹 Title
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/fortune_wheel_title.png',
              width: 150,
              height: 120,
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 20,
            child: ZoomTapAnimation(
              onTap: () {
                ConfigRouter.pushPage(context, SettingScreen());
              },
              child: GradientText(
                "Setting",
                textAlign: TextAlign.end,
                style: TextStyles.bodyReg20,
                gradient: LinearGradient(colors: const [orange3, orange4]),
              ),
            ),

          ),

          Center(
            child: SizedBox(
              height: adjustedWheelSize,
              width: adjustedWheelSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: adjustedWheelSize * 0.93,
                    child: FortuneWheel(
                      indicators: const [],
                      selected: controller.stream,
                      items: [
                        for (int i = 0; i < prizes.length; i++)
                          FortuneItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GradientText(
                                  prizes[i] == "Try Again"
                                      ? prizes[i]
                                      : "\$ ${prizes[i]}",
                                  style: TextStyles.bodyReg20,
                                  gradient: LinearGradient(
                                    colors: const [orange3, orange4],
                                  ),
                                ),
                              ],
                            ),
                            style: FortuneItemStyle(
                              borderColor: Colors.red,
                              color: i.isEven ? Colors.white : Colors.red,
                              borderWidth: 2,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/bordb.png',
                        width: adjustedWheelSize,
                        height: adjustedWheelSize,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.amber,
                        ),
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          Positioned(
            bottom: 50,
            left: 70,
            right: 70,
            child: SpinButton(enabled: !isSpinning, onTap: spinWheel),
          ),
        ],
      ),
    );
  }
}
