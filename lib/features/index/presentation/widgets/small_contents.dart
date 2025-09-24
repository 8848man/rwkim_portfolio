import '../_index.dart';

Widget indexAnimatedContainer({
  int delayMs = 300,
  AppearAnimationType animationType = AppearAnimationType.slideUp,
  required Widget child,
  Color color = Colors.amberAccent,
}) {
  return AnimationAppear(
    delayMs: delayMs,
    animationType: animationType,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(color: color, child: Center(child: child)),
    ),
  );
}

Widget indexHoverContents({
  int delayMs = 300,
  AppearAnimationType animationType = AppearAnimationType.slideUp,
  required Widget child,
  Color color = Colors.amberAccent,
}) {
  return HoverGradientOverlay(
    child: indexAnimatedContainer(
      delayMs: delayMs,
      child: child,
      color: color,
      animationType: animationType,
    ),
  );
}
