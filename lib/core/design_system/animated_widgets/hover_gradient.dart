import '../_index.dart';

class HoverGradientOverlay extends StatefulWidget {
  final Widget child;
  final Gradient gradient;

  const HoverGradientOverlay({
    super.key,
    required this.child,
    this.gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black12],
    ),
  });

  @override
  State<HoverGradientOverlay> createState() => _HoverGradientOverlayState();
}

class _HoverGradientOverlayState extends State<HoverGradientOverlay> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Stack(
        children: [
          widget.child,
          // ✅ 오버레이 부분
          AnimatedOpacity(
            opacity: _isHovering ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.gradient,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
