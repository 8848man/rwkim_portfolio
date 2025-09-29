import '../_index.dart';

class AboutMeScreen extends ConsumerWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          AboutMeFirstSection(mediaHeight: mediaHeight, mediaWidth: mediaWidth),
        ],
      ),
    );
  }
}
