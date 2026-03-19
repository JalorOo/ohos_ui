import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HarmonyPopMenu {
  static OverlayEntry? _entry;

  static void show({
    required BuildContext context,
    required List<Widget> items,
    Offset? position,
    GlobalKey? targetKey,
  }) {
    assert(position != null || targetKey != null,
        'Either position or targetKey must be provided');

    Offset overlayPosition = position ?? Offset.zero;

    if (targetKey != null) {
      final RenderBox? renderBox =
          targetKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final Offset offset = renderBox.localToGlobal(Offset.zero);
        final Size size = renderBox.size;
        overlayPosition = Offset(offset.dx, offset.dy + size.height);
      }
    }

    final overlay = Overlay.of(context);

    _entry = OverlayEntry(
      builder: (context) => _PopMenuWidget(
        position: overlayPosition,
        items: items,
        onDismiss: dismiss,
      ),
    );

    overlay.insert(_entry!);
  }

  static void dismiss() {
    _entry?.remove();
    _entry = null;
  }
}

class _PopMenuWidget extends StatefulWidget {
  final Offset position;
  final List<Widget> items;
  final VoidCallback onDismiss;

  const _PopMenuWidget({
    required this.position,
    required this.items,
    required this.onDismiss,
  });

  @override
  State<_PopMenuWidget> createState() => _PopMenuWidgetState();
}

class _PopMenuWidgetState extends State<_PopMenuWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _scale = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _opacity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDismiss() {
    _controller.reverse().then((_) => widget.onDismiss());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleDismiss,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          Positioned(
            left: widget.position.dx,
            top: widget.position.dy,
            child: FadeTransition(
              opacity: _opacity,
              child: ScaleTransition(
                scale: _scale,
                alignment: Alignment.topLeft,
                child: _buildMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Material(
      color: Colors.transparent,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.items,
        ),
      ),
    );
  }
}

class HarmonyPopupMenuItem extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const HarmonyPopupMenuItem({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  State<HarmonyPopupMenuItem> createState() => _HarmonyPopupMenuItemState();
}

class _HarmonyPopupMenuItemState extends State<HarmonyPopupMenuItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed ? const Color(0xFFF1F3F5) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
