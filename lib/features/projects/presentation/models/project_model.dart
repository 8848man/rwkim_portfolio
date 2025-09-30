class ProjectModel {
  final int startYear;
  final int endYear;
  final int startMonth;
  final int endMonth;
  final String name;
  final List<String> imageUrlList;

  const ProjectModel({
    required this.startYear,
    required this.endYear,
    required this.startMonth,
    required this.endMonth,
    required this.name,
    required this.imageUrlList,
  });
}
