import 'package:flutter/material.dart';

class HarmonyPressEffect extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressedScale;
  final Duration duration;
  final Curve curve;

  const HarmonyPressEffect({
    super.key,
    required this.child,
    this.onTap,
    this.pressedScale = 0.85,
    this.duration = const Duration(milliseconds: 120),
    this.curve = Curves.easeOut,
  });

  @override
  State<HarmonyPressEffect> createState() => _HarmonyPressEffectState();
}

class _HarmonyPressEffectState extends State<HarmonyPressEffect> {
  double scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => scale = widget.pressedScale);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => scale = 1.0);
    widget.onTap?.call();
  }

  void _onTapCancel() {
    setState(() => scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: scale,
        duration: widget.duration,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}