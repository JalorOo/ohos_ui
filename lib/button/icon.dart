import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../effect.dart';

class HarmonyIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconName;
  final Color backgroundColor;
  final double size;

  const HarmonyIconButton({
    super.key,
    this.onTap,
    this.iconName = "xmark",
    this.backgroundColor = const Color(0xffe7e8ea),
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return HarmonyPressEffect(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        width: size + 16,
        height: size + 16,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "res/icons/$iconName.svg",
          package: "ohos_ui",
          width: size,
          height: size,
        ),
      ),
    );
  }
}