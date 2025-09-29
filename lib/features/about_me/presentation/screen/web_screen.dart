import '../_index.dart';

class AboutMeWebScreen extends ConsumerWidget {
  const AboutMeWebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height - appBarHeight;
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
