import '../_index.dart';

enum AppearAnimationType { fadeIn, slideUp, slideDown, slideLeft, slideRight }

class AnimationAppear extends StatefulWidget {
  final Widget child;
  final int delayMs;
  final Duration duration;
  final Curve curve;
  final bool activeAnimation;
  final bool isAppear;
  final AppearAnimationType animationType;

  const AnimationAppear({
    super.key,
    required this.child,
    this.delayMs = 0,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOut,
    this.activeAnimation = true,
    this.isAppear = true,
    this.animationType = AppearAnimationType.slideUp,
  });

  @override
  State<AnimationAppear> createState() => _AnimationAppearState();
}

class _AnimationAppearState extends State<AnimationAppear>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // 슬라이드 방향에 따른 Offset 설정
    _offset = getOffset(
      widget.animationType,
      widget.child,
      _controller,
      widget.curve,
    );

    // Delay 후 애니메이션 시작
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) {
        widget.isAppear ? _controller.forward() : _controller.reverse();
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnimationAppear oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.activeAnimation) return;

    if (widget.isAppear != oldWidget.isAppear) {
      Future.delayed(Duration(milliseconds: widget.delayMs), () {
        if (mounted) {
          widget.isAppear ? _controller.forward() : _controller.reverse();
        }
      });
    }
  }

  void disappear() {
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.activeAnimation) {
      // 애니메이션 비활성화 시 바로 child 리턴
      return widget.child;
    }
    return SlideTransition(
      position: _offset,
      child: FadeTransition(opacity: _opacity, child: widget.child),
    );
  }
}

Animation<Offset> getOffset(
  AppearAnimationType type,
  Widget widget,
  AnimationController controller,
  Curve curve,
) {
  switch (type) {
    case AppearAnimationType.slideUp:
      return Tween<Offset>(
        begin: const Offset(0, 0.1), // 약 10px 아래 (dy: 0.1)
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: curve));
    case AppearAnimationType.slideDown:
      return Tween<Offset>(
        begin: const Offset(0, -0.1), // 약 10px 위 (dy: -0.1)
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: curve));
    case AppearAnimationType.slideLeft:
      return Tween<Offset>(
        begin: const Offset(0.1, 0), // 약 10px 오른쪽 (dx: 0.1)
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: curve));
    case AppearAnimationType.slideRight:
      return Tween<Offset>(
        begin: const Offset(-0.1, 0), // 약 10px 왼쪽 (dx: -0.1)
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: curve));
    case AppearAnimationType.fadeIn:
      return Tween<Offset>(
        begin: Offset.zero,
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: curve));
  }
}
