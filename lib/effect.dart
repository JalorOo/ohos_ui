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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = widget.pressedScale),
      onTapCancel: () => setState(() => scale = 1),
      onTapUp: (_) async {
        await Future.delayed(const Duration(milliseconds: 70));
        if (mounted) setState(() => scale = 1);
        widget.onTap?.call();
      },
      child: AnimatedScale(
        scale: scale,
        duration: widget.duration,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}