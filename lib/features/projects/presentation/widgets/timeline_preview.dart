import '../_index.dart';

class TimelinePreview extends StatefulWidget {
  final ScrollController scrollController;
  final int totalMonths;
  final int startYear;
  final double monthWidth;
  final double contentsRowWidth;
  final double contentsViewWidth;

  const TimelinePreview({
    super.key,
    required this.scrollController,
    required this.totalMonths,
    required this.startYear,
    required this.monthWidth,
    required this.contentsRowWidth,
    required this.contentsViewWidth,
  });

  @override
  State<TimelinePreview> createState() => _TimelinePreviewState();
}

class _TimelinePreviewState extends State<TimelinePreview> {
  double scrollRatio = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    setState(() {
      scrollRatio = (widget.scrollController.offset / maxScroll).clamp(
        0.0,
        1.0,
      );
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final arrowWidth = constraints.maxWidth; // 부모 constraints 대신
          final indicatorLeft = scrollRatio * (arrowWidth - 32);
          final screenRatio =
              widget.contentsViewWidth / widget.contentsRowWidth;
          final scrollIndicatorWidth = screenRatio * arrowWidth;
          return Stack(
            children: [
              AnimatedArrow(), // 배경 화살표
              // 월 단위 눈금 + 연도 레이블
              for (int i = 0; i < widget.totalMonths; i++)
                Positioned(
                  top: 23,
                  left: (i / widget.totalMonths) * arrowWidth,
                  child: Column(
                    children: [
                      if (i % 12 == 0)
                        Text(
                          '${widget.startYear + (i ~/ 12)}',
                          style: TextStyle(fontSize: 12),
                        ),
                      SizedBox(height: 4),
                      if (i % 12 == 0)
                        Container(width: 1, height: 4, color: Colors.black),
                    ],
                  ),
                ),

              // 위젯 빌드 상태일 때의 에러 로그 방지
              if (widget.contentsViewWidth != 0 && widget.contentsRowWidth != 0)
                // 스크롤 위치 표시 화살표
                Positioned(
                  top: 60,
                  left:
                      indicatorLeft - (scrollIndicatorWidth / 2) <= 0
                          ? 0
                          : indicatorLeft - (scrollIndicatorWidth / 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 7,
                    width: scrollIndicatorWidth / 2,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AnimatedArrow extends StatefulWidget {
  final double height;
  final double iconSize;
  final Color color;
  final Duration duration;

  const AnimatedArrow({
    super.key,
    this.height = 4,
    this.iconSize = 40,
    this.color = Colors.blue,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<AnimatedArrow> createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<AnimatedArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _widthAnimation;
  bool showIcon = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _widthAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showIcon = true;
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth - widget.iconSize;

        return Stack(
          children: [
            AnimatedBuilder(
              animation: _widthAnimation,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: widget.height,
                    width: maxWidth * _widthAnimation.value,
                    color: widget.color,
                  ),
                );
              },
            ),
            if (showIcon)
              AnimationAppear(
                animationType: AppearAnimationType.slideRight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_right_alt,
                    size: widget.iconSize,
                    color: widget.color,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
