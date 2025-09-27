import '../_index.dart';

class AboutMeFirstSection extends ConsumerWidget {
  final double mediaHeight;
  final double mediaWidth;
  const AboutMeFirstSection({
    super.key,
    required this.mediaHeight,
    required this.mediaWidth,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: mediaWidth,
      height: mediaHeight,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: Center(child: Text("about me")),
        ),
      ),
    );
  }
}
