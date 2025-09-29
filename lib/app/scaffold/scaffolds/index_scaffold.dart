import '../_index.dart';

class IndexScaffold extends ConsumerWidget {
  final Widget child;
  const IndexScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);
    return Scaffold(
      extendBodyBehindAppBar: true, // ✅ body를 AppBar 뒤로 확장
      appBar: myAppBar(
        context: context,
        ref: ref,
        titleText: AnimationAppear(child: Text(ScaffoldString.index(context))),
        actions: [
          positiveButton(
            text: localeState.state.locale.languageCode.toUpperCase(),
            onPressed: () => ref.read(localeProvider.notifier).toggleLocale(),
          ),
          SizedBox(width: 16),
        ],
      ),
      endDrawer: EndDrawer(),
      body: indexContents(context, child),
    );
  }

  Widget indexContents(BuildContext context, Widget child) {
    return Stack(children: [child, createdBy(context)]);
  }

  Widget indexBackground(BuildContext context) {
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
      child: Text(
        ScaffoldString.createdBy(context),
        style: TextStyle(fontSize: 8),
      ),
    );
  }
}
