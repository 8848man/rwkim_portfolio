import '../_index.dart';

class MainScaffold extends ConsumerWidget {
  final Widget child;
  final String? childPath;
  const MainScaffold({super.key, required this.child, this.childPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);
    final data = ref.watch(indexStateProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(indexStateProvider.notifier);
      final newState = IndexState.values.firstWhere(
        (e) => e.name == childPath?.replaceFirst('/', ''),
        orElse: () => IndexState.aboutMe,
      );
      if (notifier.state != newState) {
        notifier.state = newState;
      }
    });
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ body를 AppBar 뒤로 확장
      appBar: myAppBar(
        context: context,
        ref: ref,
        titleText: mainTitle(data.localized(context)),
        actions: [
          AnimatedTab(
            titles:
                IndexState.values
                    .map((e) => e.localized(context)) // enum → localized string
                    .toList(),
          ),
          SizedBox(width: 8),
          positiveButton(
            text: localeState.state.locale.languageCode.toUpperCase(),
            onPressed: () => ref.read(localeProvider.notifier).toggleLocale(),
          ),
          SizedBox(width: 16),
        ],
      ),
      endDrawer: EndDrawer(),
      body: mainContents(context, child, childPath),
    );
  }

  Widget mainTitle(String title) {
    return AnimationAppear(
      key: ValueKey(title),
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }

  Widget mainContents(BuildContext context, Widget child, String? childKey) {
    return Stack(
      children: [
        mainBackground(context),
        Padding(
          padding: EdgeInsetsGeometry.only(top: appBarHeight),
          child: AnimationAppear(
            key: ValueKey(childKey),
            animationType: AppearAnimationType.slideRight,
            child: child,
          ),
        ),
        createdBy(context),
      ],
    );
  }

  Widget mainBackground(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/main_image.webp",
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }

  Widget createdBy(BuildContext context) {
    return Positioned(
      left: 16, // 좌측 여백
      bottom: 16, // 하단 여백
      child: Positioned(
        left: 16, // 좌측 여백
        bottom: 16, // 하단 여백
        child: Text(
          ScaffoldString.createdBy(context),
          style: TextStyle(fontSize: 8, color: Colors.white),
        ),
      ),
    );
  }
}

class AnimatedTab extends ConsumerWidget {
  final List<String> titles;

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
                  ref
                      .read(appRouterProvider)
                      .replaceNamed(routeNameMapper(titles[index]));
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
                      titles[index],
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
