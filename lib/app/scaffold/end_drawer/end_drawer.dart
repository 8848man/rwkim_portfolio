import '../_index.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int delayMs = 100;
    final List<String> mainTitles =
        IndexState.values
            .map((e) => e.localized(context)) // enum → localized string
            .toList();
    final data = ref.watch(indexStateProvider);
    final nowPath = ref.watch(appRouterProvider).state.path;
    final bool isIndex = nowPath == '/index';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      color: Colors.white.withOpacity(0.7),
      width: 300,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AnimationAppear(
            delayMs: delayMs,
            child: determinePositiveButton(
              isIndex,
              text: 'index',
              onPressed:
                  () => ref.read(appRouterProvider).replaceNamed('index'),
            ),
          ),
          SizedBox(height: 8),
          ...List.generate(
            mainTitles.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AnimationAppear(
                delayMs: delayMs * 2 + index * delayMs,
                child: determinePositiveButton(
                  isIndex != true &&
                      data.name == routeNameMapper(mainTitles[index]),
                  text: mainTitles[index],
                  onPressed:
                      () => {
                        Scaffold.of(context).closeEndDrawer(),
                        ref
                            .read(appRouterProvider)
                            .replaceNamed(routeNameMapper(mainTitles[index])),
                      },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
