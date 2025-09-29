import '../_index.dart';

Widget appearScrollView(
  List<String> texts, {
  int delayMs = 300,
  int durationMs = 700,
  double fontSize = 16,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight, // 화면보다 작을 때 최소 높이 보장
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(texts.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AnimationAppear(
                    delayMs:
                        mainAnimationDelayMs +
                        (index + 1) * delayMs, // 간격 자동 증가
                    duration: Duration(milliseconds: durationMs),
                    child: myText(
                      texts[index],
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
