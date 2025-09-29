import '../_index.dart';

class TendencyFirstSection extends ConsumerWidget {
  const TendencyFirstSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Tendency> dataList = tendencyGen(context);
    return MainWebSectionLayout(
      child: Column(
        children: [
          upperRow(context, dataList).expand(),
          lowerRow(context, dataList).expand(),
        ],
      ),
    );
  }

  Widget upperRow(BuildContext context, List<Tendency> data) {
    return Row(
      children: [
        AnimationAppear(
          delayMs: 100,
          child: tendencyCard(context, heroTag: 'hero1', data: data[0]),
        ).expand(),
        AnimationAppear(
          delayMs: 200,
          child: tendencyCard(context, heroTag: 'hero2', data: data[1]),
        ).expand(),
        AnimationAppear(
          delayMs: 300,
          child: tendencyCard(context, heroTag: 'hero3', data: data[2]),
        ).expand(),
      ],
    );
  }

  Widget lowerRow(BuildContext context, List<Tendency> data) {
    return Row(
      children: [
        AnimationAppear(
          delayMs: 400,
          child: tendencyCard(context, heroTag: 'hero4', data: data[3]),
        ).expand(flex: 4),
        AnimationAppear(
          delayMs: 500,
          child: tendencyExplainInteg(context, data),
        ).expand(flex: 6),
      ],
    );
  }

  List<Tendency> tendencyGen(BuildContext context) {
    final List<Tendency> dataList = [
      Tendency(
        type: TendencyStrings.creativity(context),
        description: TendencyStrings.creativityDesc(context),
        score: 80,
      ),
      Tendency(
        type: TendencyStrings.persistence(context),
        description: TendencyStrings.persistenceDesc(context),
        score: 80,
      ),
      Tendency(
        type: TendencyStrings.receptivity(context),
        description: TendencyStrings.receptivityDesc(context),
        score: 60,
      ),
      Tendency(
        type: TendencyStrings.problemSolvingSkill(context),
        description: TendencyStrings.problemSolvingSkillDesc(context),
        score: 70,
      ),
    ];
    return dataList;
  }
}
