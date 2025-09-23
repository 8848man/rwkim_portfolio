import '../_index.dart';

class HomeScaffold extends ConsumerWidget {
  final Widget child;
  const HomeScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Auth'),
      // ),
      // drawer: homeDrawer(),
      body: homeContents(child),
    );
  }
}

Widget homeDrawer() {
  return Drawer();
}

Widget homeContents(Widget child) {
  return child;
}
