import '../_index.dart';

class MainScaffold extends ConsumerWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);
    final data = ref.watch(indexStateProvider);
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ body를 AppBar 뒤로 확장
      appBar: myAppBar(
        context: context,
        ref: ref,
        title: data.name,
        actions: [
          AnimatedTab(titles: IndexState.values.map((e) => e).toList()),
          SizedBox(width: 8),
          positiveButton(
            text: localeState.state.locale.languageCode.toUpperCase(),
            onPressed: () => ref.read(localeProvider.notifier).toggleLocale(),
          ),
          SizedBox(width: 8),
          Text('Created by Rwkim'),
          SizedBox(width: 20),
        ],
      ),
      endDrawer: endDrawer(),
      body: mainContents(child),
    );
  }
}

Widget mainDrawer() {
  return Drawer();
}

Widget mainContents(Widget child) {
  return Stack(children: [child]);
}

class AnimatedTab extends ConsumerWidget {
  final List<IndexState> titles;

  const AnimatedTab({super.key, required this.titles});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(indexStateProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600, minWidth: 400),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(titles.length, (index) {
            final isSelected = selectedIndex.idx == index;

            return Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  ref.read(appRouterProvider).goNamed(titles[index].name);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      titles[index].name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
