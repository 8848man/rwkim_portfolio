import '../_index.dart';

class SkillsFirstSection extends StatelessWidget {
  final bool isMobile;
  const SkillsFirstSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final List<SkillModel> skillList = SkillListFactory.getAll(context);

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
          itemCount: skillList.length,
          itemBuilder: (context, index) {
            return AnimationAppear(
              delayMs: mainAnimationDelayMs + index * 100,
              child: SingleSkil(skill: skillList[index]),
            );
          },
        ),
      ),
    );
  }
}
