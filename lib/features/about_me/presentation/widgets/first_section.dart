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
      child: Padding(
        padding: EdgeInsetsGeometry.all(mainSectionPadding),
        child: Row(
          children: [
            explainMyself(context).expand(flex: 4),
            mediaWidth >= 800
                ? profileContents(context).sizedBox(width: 500)
                : profileContents(context).expand(flex: 6),
          ],
        ),
      ),
    );
  }

  Widget profileContents(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            personalInfo(context).expand(flex: 6),
            profilePicture().expand(flex: 4),
          ],
        ).expand(),
        description(context).expand(),
      ],
    );
  }

  Widget profilePicture() {
    return Container(color: Colors.white);
  }
}
