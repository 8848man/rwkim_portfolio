import '../_index.dart';

class DirectionalShadow extends StatelessWidget {
  final Widget child;
  final Alignment begin;
  final Alignment end;
  final double opacity;

  const DirectionalShadow({
    super.key,
    required this.child,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                colors: [
                  Colors.black.withOpacity(opacity),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
