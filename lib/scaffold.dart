import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'button/icon.dart';

const Color _kBackgroundColor = Color(0xFFF1F3F5);
const double _kAppBarHeight = 56.0;

class OhosScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;

  const OhosScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor = _kBackgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

class OhosAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final VoidCallback? onBackPressed;

  const OhosAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor = _kBackgroundColor,
    this.titleStyle,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: leading ??
          ((onBackPressed != null || Navigator.canPop(context))
              ? Center(
                  child: HarmonyIconButton(
                    iconName: "chevron_left",
                    onTap: onBackPressed ?? () => Navigator.maybePop(context),
                    backgroundColor: Colors.transparent,
                    size: 24,
                  ),
                )
              : null),
      title: Text(
        title,
        style: titleStyle ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
      ),
      actions: actions
          ?.map((e) => Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8), child: e)))
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_kAppBarHeight);
}
