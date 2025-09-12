
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/gradient_text.dart';
import '../../../utils/style.dart';

class CustomDialogSuccess extends StatefulWidget {
  final String price;
  final String? tryAgain;
  final VoidCallback? onOk;
  const CustomDialogSuccess({super.key, required this.price, this.tryAgain,this.onOk,});

  @override
  State<CustomDialogSuccess> createState() => _CustomDialogSuccessState();
}

class _CustomDialogSuccessState extends State<CustomDialogSuccess> {
  bool _isHovered = false;

  String get resultMessage {
    switch (widget.price) {
      case "Try Again":
        return "Better luck next time!";
      default:
        return "You Win!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               
                widget.price == "Try Again"
                    ? Image.asset('assets/images/jackpot.png',)
                    : Image.asset('assets/images/congrats.png',),
                const SizedBox(height: 20),
                GradientText(
                  resultMessage,
                  style: TextStyles.bodyReg20,
                  gradient: const LinearGradient(
                    colors: [orange3, orange4],
                  ),
                ),
                const SizedBox(height: 8),
                GradientText(
                  widget.price == "Try Again" ? widget.price : "\$${widget.price}",
                  style: widget.price == "Try Again" ? TextStyles.bodyReg24 : TextStyles.bodyReg30,
                  gradient: const LinearGradient(
                    colors: [orange3, orange4],
                  ),
                ),
                const SizedBox(height: 30),
                MouseRegion(
                  cursor: _isHovered
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  onHover: (event) => setState(() => _isHovered = true),
                  onExit: (event) => setState(() => _isHovered = false),
                  child: ZoomTapAnimation(
                    key: const ValueKey('OkButton'),
                    onTap: () {
                      if (widget.onOk != null) {
                        widget.onOk!(); // 👈 stop sound + close dialog
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Image.asset(
                      'assets/images/ok_button_pressed.png',
                      width: 120,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Builder(
            builder: (context) {
              if(widget.price == "Try Again") return SizedBox.shrink();
              return Positioned(
                child: IgnorePointer(
                  child: Lottie.asset(
                    'assets/gifs/default_lottie.json',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          ),

        ],
      ),
    );
  }
}
