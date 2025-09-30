import '../_index.dart';

class ProjectsFirstSection extends StatefulWidget {
  const ProjectsFirstSection({super.key});

  @override
  State<ProjectsFirstSection> createState() => _ProjectsFirstSectionState();
}

class _ProjectsFirstSectionState extends State<ProjectsFirstSection> {
  late final ScrollController controller;
  final GlobalKey rowKey = GlobalKey();
  final GlobalKey containerKey = GlobalKey();
  double rowWidth = 0;
  double containerWidth = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? box =
          rowKey.currentContext?.findRenderObject() as RenderBox?;
      final RenderBox? containerBox =
          containerKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null && containerBox != null) {
        setState(() {
          rowWidth = box.size.width;
          containerWidth = containerBox.size.width;
        });
      }
    });

    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final startYear = 2022;
    final now = DateTime.now();
    final totalMonths = (now.year - startYear) * 12 + now.month;

    return MainWebSectionLayout(
      child: Column(
        children: [
          MyContentsBox(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Center(
                  child: TimelinePreview(
                    scrollController: controller,
                    totalMonths: totalMonths,
                    startYear: 2022,
                    monthWidth: 40,
                    contentsRowWidth: rowWidth,
                    contentsViewWidth: containerWidth,
                  ),
                ),
              ),
            ),
          ).expand(flex: 3),
          MyContentsBox(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final totalYears = (totalMonths / 12).round();
                final viewWidth = constraints.maxWidth;
                List<Color> colors = List.generate(
                  totalYears,
                  (index) =>
                      Colors.blue[(index + 1) * 100 + (9 - totalYears) * 100]!,
                );
                return SizedBox(
                  key: containerKey,
                  width: viewWidth,
                  child: Listener(
                    onPointerSignal: (pointerSignal) {
                      if (pointerSignal is PointerScrollEvent) {
                        // 세로 휠 움직임을 가로 스크롤로 변환
                        final scrollDelta = pointerSignal.scrollDelta.dy;
                        controller.jumpTo(controller.offset + scrollDelta);
                      }
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      child: Stack(
                        children: [
                          Row(
                            key: rowKey,
                            children: List.generate(
                              totalYears,
                              (index) => Container(
                                height: 500,
                                width: viewWidth,
                                decoration: BoxDecoration(
                                  color: colors[index].withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                          ProjectContentsWidget(viewWidth: viewWidth),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ).expand(flex: 7),
        ],
      ),
    );
  }
}
