import 'package:rw_portfolio/core/utils/extensions.dart';

import '../_index.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                homeAnimatedContainer(
                  delayMs: 300,
                  animationType: AppearAnimationType.slideRight,
                  child: const Text('test'),
                  color: Colors.amberAccent,
                ).expand(),
                homeAnimatedContainer(
                  delayMs: 600,
                  animationType: AppearAnimationType.slideDown,
                  child: const Text('test'),
                  color: Colors.purpleAccent,
                ).expand(),
              ],
            ).expand(),
            Row(
              children: [
                homeAnimatedContainer(
                  delayMs: 1200,
                  animationType: AppearAnimationType.slideUp,
                  child: const Text('test'),
                  color: Colors.orangeAccent,
                ).expand(),
                homeAnimatedContainer(
                  delayMs: 900,
                  animationType: AppearAnimationType.slideLeft,
                  child: const Text('test'),
                  color: Colors.greenAccent,
                ).expand(),
              ],
            ).expand(),
            homeAnimatedContainer(
              delayMs: 450,
              animationType: AppearAnimationType.fadeIn,
              child: const Text('test'),
              color: Colors.tealAccent,
            ).expand(),
          ],
        ).expand(flex: 6),
        Container(
          child: homeAnimatedContainer(
            delayMs: 450,
            animationType: AppearAnimationType.fadeIn,
            child: const Text('test'),
            color: Colors.redAccent,
          ),
        ).expand(flex: 4),
      ],
    );
  }
}
