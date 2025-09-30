class SkillModel {
  final String type;
  final String title;
  final String description;
  final List<String> projects;
  final double score;

  SkillModel({
    required this.type,
    required this.title,
    required this.description,
    required this.projects,
    required this.score,
  });

  factory SkillModel.fromLocalization({
    required String type,
    required String title,
    required String description,
    required String projects,
    required double score,
  }) {
    return SkillModel(
      type: type,
      title: title,
      description: description,
      projects:
          projects.isEmpty
              ? []
              : projects.split(',').map((e) => e.trim()).toList(),
      score: score,
    );
  }
}
