import '../_index.dart';

class AboutMeFirstSection extends ConsumerWidget {
  const AboutMeFirstSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return MainWebSectionLayout(
      child: Row(
        children: [
          explainMyself(context).expand(flex: 4),
          mediaWidth >= 800
              ? profileContents(context).sizedBox(width: 500)
              : profileContents(context).expand(flex: 6),
        ],
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
}
