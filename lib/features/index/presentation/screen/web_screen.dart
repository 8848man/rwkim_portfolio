import '../_index.dart';

class IndexWebScreen extends ConsumerWidget {
  const IndexWebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                aboutMeContents(context, ref).expand(),
                tendencyContents(context, ref).expand(),
              ],
            ).expand(),
            Row(
              children: [
                skillContents(context, ref).expand(),
                projectsContents(context, ref).expand(),
              ],
            ).expand(),
            appealPointContents(context, ref).expand(),
          ],
        ).expand(flex: 6),
        Container(
          child: indexAnimatedContainer(
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
