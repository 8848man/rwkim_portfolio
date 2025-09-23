import '../_index.dart';

class HoverGradientOverlay extends StatefulWidget {
  final Widget child;
  final Gradient gradient;
  final Offset hoverOffset;

  const HoverGradientOverlay({
    super.key,
    required this.child,
    this.gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black12],
    ),
    this.hoverOffset = const Offset(-0.001, -0.01), // 기본값: 위로 1% 이동
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
          // ✅ 오버레이
          AnimatedOpacity(
            opacity: _isHovering ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.gradient,
              ),
            ),
          ),
          // ✅ child가 hover 시 이동
          AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            offset: _isHovering ? widget.hoverOffset : Offset.zero,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
