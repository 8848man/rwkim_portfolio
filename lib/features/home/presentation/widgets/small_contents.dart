import '../_index.dart';

Widget homeAnimatedContainer({
  int delayMs = 300,
  AppearAnimationType animationType = AppearAnimationType.slideUp,
  required Widget child,
  Color color = Colors.amberAccent,
}) {
  return HoverGradientOverlay(
    child: AnimationAppear(
      delayMs: delayMs,
      animationType: animationType,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Center(
            child: child,
          ),
        ),
      ),
    ),
  );
}
