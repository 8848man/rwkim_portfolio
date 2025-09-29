import '../_index.dart';

class AboutMeScreen extends ConsumerWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width > 600) {
      return const AboutMeWebScreen();
    } else {
      return const AboutMeMobileScreen();
    }
  }
}
