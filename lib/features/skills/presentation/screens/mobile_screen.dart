import '../_index.dart';

class SkillsMobileScreen extends StatelessWidget {
  const SkillsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [SkillsFirstSection(isMobile: true)]),
    );
  }
}
