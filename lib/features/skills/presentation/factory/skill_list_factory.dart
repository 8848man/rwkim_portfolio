import '../_index.dart';

class SkillListFactory {
  /// 기술 스택 리스트를 한 번에 생성
  static List<SkillModel> getAll(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return [
      SkillModel.fromLocalization(
        type: loc.frontend,
        title: loc.flutter,
        description: loc.flutterDesc,
        projects: loc.flutterProj,
        score: 80,
      ),
      SkillModel.fromLocalization(
        type: loc.backend,
        title: loc.firebase,
        description: loc.firebaseDesc,
        projects: loc.firebaseProj,
        score: 70,
      ),
      SkillModel.fromLocalization(
        type: loc.backend,
        title: loc.python,
        description: loc.pythonDesc,
        projects: loc.pythonProj,
        score: 50,
      ),
      SkillModel.fromLocalization(
        type: loc.backend,
        title: loc.docker,
        description: loc.dockerDesc,
        projects: loc.dockerProj,
        score: 40,
      ),
      SkillModel.fromLocalization(
        type: loc.backend,
        title: loc.googleCloud,
        description: loc.googleCloudDesc,
        projects: loc.googleCloudProj,
        score: 40,
      ),
      SkillModel.fromLocalization(
        type: loc.backend,
        title: loc.go,
        description: loc.goDesc,
        projects: loc.goProj,
        score: 20,
      ),
      SkillModel.fromLocalization(
        type: loc.frontend,
        title: loc.cpp,
        description: loc.cppDesc,
        projects: loc.cppProj,
        score: 50,
      ),
    ];
  }
}
