import '../_index.dart';

class MainWebSectionLayout extends ConsumerWidget {
  final Widget child;
  const MainWebSectionLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height - appBarHeight;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: mediaWidth,
      height: mediaHeight,
      child: Padding(
        padding: EdgeInsetsGeometry.all(mainSectionPadding),
        child: child,
      ),
    );
  }
}
