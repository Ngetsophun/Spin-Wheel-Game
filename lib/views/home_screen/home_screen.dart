import 'package:flutter/material.dart';
import 'package:spin_wheel_canadia/routes/config_router.dart';
import 'package:spin_wheel_canadia/views/spin_wheel_screen/spin_wheel_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/custom_app_bar/main_app_bar_screen.dart';
import '../../utils/gradient_text.dart';
import '../../utils/style.dart';
import '../spin_wheel_screen/create_spin_wheel_screen/create_spin_wheel_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainAppBar(
        context: context,
        appBarTitle: "Spin Wheel",
        iconRight: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: InkWell(
            onTap: (){
              ConfigRouter.pushPage(context, CreateSpinWheelScreen());
            },
            child: ZoomTapAnimation(
              child: Text(
                'Add New',
                style: TextStyles.bodyReg20.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            ConfigRouter.pushPage(context, SpinWheelScreen());
          },
          child: ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  bottom: 5,
                  top: 5,
                ),
                child: Column(
                  children: [
                    ZoomTapAnimation(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GradientText(
                                          'CanaPoints',
                                          style: TextStyles.bodyReg24,
                                          gradient: const LinearGradient(
                                            colors: [orange3, orange4],
                                          ),
                                        ),
                                        GradientText(
                                          'Spins : 6',
                                          style: TextStyles.bodyReg16,
                                          gradient: const LinearGradient(
                                            colors: [orange3, orange4],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GradientText(
                                    'Last Spin : Sep 12 ,2025, at 5:05 PM',
                                    style: TextStyles.bodyReg10,
                                    gradient: const LinearGradient(
                                      colors: [orange3, orange4],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/img_banner.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
