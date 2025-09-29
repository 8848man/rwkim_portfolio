import '../_index.dart';

class AboutMeMobileScreen extends ConsumerWidget {
  const AboutMeMobileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 300, child: explainMyself(context)),

          // SizedBox(height: 300, child: personalInfo(context)),
          Row(
            children: [
              personalInfo(context).expand(flex: 6),
              profilePicture().expand(flex: 4),
            ],
          ).sizedBox(height: 300),
          SizedBox(height: 300, child: description(context)),
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(color: Colors.white);
  }
}
