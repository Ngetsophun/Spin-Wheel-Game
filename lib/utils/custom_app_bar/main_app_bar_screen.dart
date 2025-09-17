import 'package:flutter/material.dart';

import '../style.dart';

Widget mainAppBar({
  required BuildContext context,   // 👈 add context here
  required String appBarTitle,
  Function()? backClick,
  double bodyMarginBottom = 25,
  Color colorIconBack = Colors.white,
  Widget? iconRight,
  required Widget child,
}) {
  return Stack(
    children: [
      // Background image
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/background.png",
          fit: BoxFit.cover,
        ),
      ),

      // App bar row (back, title, right icon)
      Positioned(
        top: MediaQuery.of(context).size.height * 0.07,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 48, // Set height for vertical alignment
            child: Row(
              children: [
                // Back button
                if (backClick != null)
                  SizedBox(
                    width: 40,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: backClick,
                      icon: Icon(Icons.arrow_back_ios_new, color: colorIconBack),
                    ),
                  )
                else
                  const SizedBox(width: 40),

                // Title (centered)
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      appBarTitle,
                      style: TextStyles.bodyReg24.copyWith(color: Colors.white),
                    ),
                  ),
                ),

                // Right icon (same size as left)
                SizedBox(
                 // width: 60,
                  child: iconRight ?? const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),

      // Body content below the app bar
      Positioned(
        top: MediaQuery.of(context).size.height * 0.15,
        left: 0,
        right: 0,
        bottom: 0,
        child: child,
      ),
    ],
  );
}
