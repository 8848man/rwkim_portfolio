import '../_index.dart';

class SkillsWebScreen extends StatelessWidget {
  const SkillsWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [SkillsFirstSection(isMobile: false)]),
    );
  }
}
