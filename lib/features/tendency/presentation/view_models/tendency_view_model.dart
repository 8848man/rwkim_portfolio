import '../_index.dart';
part 'tendency_view_model.g.dart';

@riverpod
class TendencyViewModel extends _$TendencyViewModel {
  @override
  TendencyPageState build(BuildContext context) {
    return getTendencyModels(context);
  }

  TendencyPageState getTendencyModels(BuildContext context) {
    final List<TendencyContentsModel> dataList = [
      TendencyContentsModel(
        type: TendencyStrings.creativity(context),
        description: TendencyStrings.creativityDesc(context),
        score: 80,
      ),
      TendencyContentsModel(
        type: TendencyStrings.persistence(context),
        description: TendencyStrings.persistenceDesc(context),
        score: 80,
      ),
      TendencyContentsModel(
        type: TendencyStrings.receptivity(context),
        description: TendencyStrings.receptivityDesc(context),
        score: 60,
      ),
      TendencyContentsModel(
        type: TendencyStrings.problemSolvingSkill(context),
        description: TendencyStrings.problemSolvingSkillDesc(context),
        score: 70,
      ),
    ];
    return TendencyPageState(datas: dataList);
  }
}
