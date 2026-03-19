import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HarmonyIconButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String iconName;
  final Color backgroundColor;
  final double buttonSize,iconSize;

  const HarmonyIconButton({
    super.key,
    this.onTap,
    this.iconName = "xmark",
    this.backgroundColor = const Color(0xffe7e8ea),
    this.iconSize = 24,
    this.buttonSize = 40,
  });

  @override
  State<HarmonyIconButton> createState() => _HarmonyIconButtonState();
}

class _HarmonyIconButtonState extends State<HarmonyIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isPressed
                ? Color.lerp(widget.backgroundColor, Colors.black, 0.1)
                : widget.backgroundColor,
          ),
          width: widget.buttonSize,
          height: widget.buttonSize,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "res/icons/${widget.iconName}.svg",
            package: "ohos_ui",
            width: widget.iconSize,
            height: widget.iconSize,
          ),
        ),
      ),
    );
  }
}