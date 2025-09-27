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
          SizedBox(width: 8),
          Text(ScaffoldString.createdBy(context)),
          SizedBox(width: 20),
        ],
      ),
      endDrawer: endDrawer(),
      body: indexContents(child),
    );
  }
}

Widget indexDrawer() {
  return Drawer();
}

Widget indexContents(Widget child) {
  return Stack(children: [child]);
}
