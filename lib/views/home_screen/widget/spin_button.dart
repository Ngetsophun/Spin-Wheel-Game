import 'package:flutter/material.dart';

class SpinButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool enabled; // 🔹 Add enabled flag

  const SpinButton({super.key, required this.onTap, this.enabled = true});

  @override
  State<SpinButton> createState() => _SpinButtonState();
}

class _SpinButtonState extends State<SpinButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    if (!widget.enabled) return; // prevent tap
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (!widget.enabled) return; // prevent tap
    setState(() {
      _scale = 1.0;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    if (!widget.enabled) return;
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Center(
          child: Image.asset("assets/images/spin_button_pressed.png"),
        ),
      ),
    );
  }
}
