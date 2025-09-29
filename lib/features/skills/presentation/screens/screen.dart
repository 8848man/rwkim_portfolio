import '../_index.dart';

class SkillScreen extends ConsumerWidget {
  const SkillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width > 600) {
      return const SkillsWebScreen();
    } else {
      return const SkillsMobileScreen();
    }
  }
}
