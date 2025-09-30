import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline ScrollBar Demo',
      home: const TimelineDemoPage(),
    );
  }
}

class TimelineDemoPage extends StatefulWidget {
  const TimelineDemoPage({super.key});

  @override
  State<TimelineDemoPage> createState() => _TimelineDemoPageState();
}

class _TimelineDemoPageState extends State<TimelineDemoPage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timeline ScrollBar Demo')),
      body: Column(
        children: [
          // Timeline + Scroll Indicator
          TimelineWithScrollBar(scrollController: _controller),
          const SizedBox(height: 16),

          // Horizontal scrollable content
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.all(8),
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineWithScrollBar extends StatelessWidget {
  final ScrollController scrollController;
  final double arrowHeight;
  final double barHeight;

  const TimelineWithScrollBar({
    super.key,
    required this.scrollController,
    this.arrowHeight = 6,
    this.barHeight = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: arrowHeight + barHeight + 16,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final arrowWidth = constraints.maxWidth;

          return Stack(
            children: [
              // 메인 화살표
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: arrowWidth,
                  height: arrowHeight,
                  color: Colors.blue,
                ),
              ),

              // 스크롤 위치 바
              // AnimatedBuilder(
              //   animation: scrollController,
              //   builder: (context, child) {
              //     double maxScroll =
              //         scrollController.hasClients
              //             ? scrollController.position.maxScrollExtent
              //             : 1.0;
              //     double ratio = (scrollController.hasClients
              //             ? scrollController.offset / maxScroll
              //             : 0.0)
              //         .clamp(0.0, 1.0);

              //     return Positioned(
              //       left: ratio * (arrowWidth - 60), // 60 = 스크롤바 width
              //       top: arrowHeight + 4,
              //       child: Container(
              //         width: 60,
              //         height: barHeight,
              //         decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // AnimatedBuilder(
              //   animation: scrollController,
              //   builder: (context, child) {
              //     final maxScroll =
              //         scrollController.hasClients
              //             ? scrollController.position.maxScrollExtent
              //             : 1.0;
              //     final ratio = (scrollController.hasClients
              //             ? scrollController.offset / maxScroll
              //             : 0.0)
              //         .clamp(0.0, 1.0);

              //     return Container(
              //       width: MediaQuery.of(context).size.width * ratio,
              //       height: 4,
              //       color: Colors.blue,
              //     );
              //   },
              // ),
              ScrollIndicator(controller: scrollController),
            ],
          );
        },
      ),
    );
  }
}

class ScrollIndicator extends StatefulWidget {
  final ScrollController controller;
  const ScrollIndicator({super.key, required this.controller});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double ratio = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateRatio);
  }

  void _updateRatio() {
    if (!widget.controller.hasClients) return;
    final maxScroll = widget.controller.position.maxScrollExtent;
    setState(() {
      ratio = (widget.controller.offset / (maxScroll > 0 ? maxScroll : 1))
          .clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateRatio);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * ratio,
      height: 4,
      color: Colors.blue,
    );
  }
}
