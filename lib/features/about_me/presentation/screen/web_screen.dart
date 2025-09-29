import '../_index.dart';

class AboutMeWebScreen extends ConsumerWidget {
  const AboutMeWebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(children: [AboutMeFirstSection()]),
    );
  }
}
