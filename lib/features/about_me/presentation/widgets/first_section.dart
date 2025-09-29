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
            stringContents(context).expand(flex: 4),
            mediaWidth >= 800
                ? profileContents().sizedBox(width: 500)
                : profileContents().expand(flex: 6),
          ],
        ),
      ),
    );
  }

  Widget stringContents(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimationAppear(
            delayMs: mainAnimationDelayMs + 200,
            duration: Duration(milliseconds: 700),
            child: myText(
              AboutMeString.upperString(context),
              style: TextStyle(color: mainDefaultColors, fontSize: 24),
            ),
          ),
          SizedBox(height: 4),
          AnimationAppear(
            delayMs: mainAnimationDelayMs + 800,
            duration: Duration(milliseconds: 700),
            child: myText(
              AboutMeString.lowerString(context),
              style: TextStyle(color: mainDefaultColors, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileContents() {
    return Column(
      children: [
        Row(
          children: [
            personalInfo().expand(flex: 6),
            profilePicture().expand(flex: 4),
          ],
        ).expand(),
        description().expand(),
      ],
    );
  }

  Widget personalInfo() {
    return Container(color: Colors.amber);
  }

  Widget profilePicture() {
    return Container(color: Colors.white);
  }

  Widget description() {
    return Container(color: Colors.blue);
  }
}
