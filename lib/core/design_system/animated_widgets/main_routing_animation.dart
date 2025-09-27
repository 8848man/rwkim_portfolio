import '../_index.dart';

class AnimatedPageWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const AnimatedPageWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
  });

  @override
  State<AnimatedPageWrapper> createState() => _AnimatedPageWrapperState();
}

class _AnimatedPageWrapperState extends State<AnimatedPageWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    // 오른쪽 -> 중앙
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(); // 등장 애니메이션 재생
  }

  /// 퇴장 애니메이션 실행
  Future<void> playExitAnimation() async {
    await _controller.reverse(from: 1); // 중앙 -> 왼쪽 + fade out
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: FractionalTranslation(
            translation: _slideAnimation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class PageStackWrapper extends StatefulWidget {
  final Widget child;
  final String pageKey;

  const PageStackWrapper({
    super.key,
    required this.child,
    required this.pageKey,
  });

  @override
  State<PageStackWrapper> createState() => _PageStackWrapperState();
}

class _PageStackWrapperState extends State<PageStackWrapper>
    with TickerProviderStateMixin {
  _PageEntry? _currentPage;
  _PageEntry? _previousPage;

  @override
  void initState() {
    super.initState();
    _setPage(widget.child, widget.pageKey);
  }

  @override
  void didUpdateWidget(covariant PageStackWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pageKey != oldWidget.pageKey) {
      _setPage(widget.child, widget.pageKey);
    }
  }

  void _setPage(Widget child, String key) {
    final newPage = _PageEntry(
      key: key,
      child: child,
      controller: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );

    newPage.controller.forward(); // 새 페이지 등장

    if (_currentPage != null) {
      // 기존 페이지 퇴장 애니메이션 시작
      final oldPage = _currentPage!;
      oldPage.controller.reverse().then((_) {
        // 퇴장 완료 후 제거
        oldPage.controller.dispose();
        setState(() {
          _previousPage = null;
        });
      });
      setState(() {
        _previousPage = oldPage; // exit animation 동안 Stack에 유지
      });
    }

    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  void dispose() {
    _currentPage?.controller.dispose();
    _previousPage?.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 두 위젯 모두 Stack에 존재하도록 순서 유지
    final pages = [
      if (_previousPage != null)
        _AnimatedPage(page: _previousPage!, isEntering: false),
      if (_currentPage != null)
        _AnimatedPage(page: _currentPage!, isEntering: true),
    ];

    return Stack(children: pages);
  }
}

class _AnimatedPage extends StatelessWidget {
  final _PageEntry page;
  final bool isEntering;

  const _AnimatedPage({required this.page, required this.isEntering});

  @override
  Widget build(BuildContext context) {
    final slideTween =
        isEntering
            ? Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            : Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0));

    final fadeTween =
        isEntering
            ? Tween<double>(begin: 0, end: 1)
            : Tween<double>(begin: 1, end: 0);

    return AnimatedBuilder(
      animation: page.controller,
      builder: (_, child) {
        return Opacity(
          opacity: fadeTween.evaluate(page.controller),
          child: FractionalTranslation(
            translation: slideTween.evaluate(page.controller),
            child: child,
          ),
        );
      },
      child: page.child, // rebuild 방지
    );
  }
}

class _PageEntry {
  final String key;
  final Widget child;
  final AnimationController controller;

  _PageEntry({
    required this.key,
    required this.child,
    required this.controller,
  });
}
