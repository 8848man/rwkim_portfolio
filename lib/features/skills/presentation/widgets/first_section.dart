import '../_index.dart';

class SkillsFirstSection extends StatelessWidget {
  final bool isMobile;
  const SkillsFirstSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final SkillModel dummySkill = SkillModel(
      title: 'flutter',
      description: 'description',
      projects: [],
    );

    return MainWebSectionLayout(
      child: SizedBox.expand(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile == true ? 1 : 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            mainAxisExtent: 120,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimationAppear(
              delayMs: mainAnimationDelayMs + index * 100,
              child: singleSkillWidget(dummySkill),
            );
          },
        ),
      ),
    );
  }
}
