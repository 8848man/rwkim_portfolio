import '../_index.dart';

class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width > 600) {
      return const IndexWebScreen();
    } else {
      return const IndexMobileScreen();
    }
  }
}
