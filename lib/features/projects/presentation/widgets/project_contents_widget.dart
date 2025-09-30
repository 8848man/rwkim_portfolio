import '../_index.dart';

class ProjectContentsWidget extends StatelessWidget {
  final double viewWidth;
  const ProjectContentsWidget({super.key, required this.viewWidth});

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectModel(
        startYear: 2022,
        endYear: 2023,
        startMonth: 1,
        endMonth: 6,
        name: 'A',
        imageUrlList: [],
      ),
      ProjectModel(
        startYear: 2022,
        endYear: 2023,
        startMonth: 3,
        endMonth: 9,
        name: 'B',
        imageUrlList: [],
      ), // A와 겹침 → lane2
      ProjectModel(
        startYear: 2023,
        endYear: 2025,
        startMonth: 7,
        endMonth: 1,
        name: 'C',
        imageUrlList: [],
      ), // 안겹침 → lane1
      ProjectModel(
        startYear: 2022,
        endYear: 2023,
        startMonth: 2,
        endMonth: 12,
        name: 'D',
        imageUrlList: [],
      ), // 안겹침 → lane1
    ];

    return ProjectTimelineWidget(
      allProjects: projects,
      baseYear: 2022,
      viewWidth: viewWidth,
    );
  }
}

class ProjectBox {
  final double left;
  final double width;
  final ProjectModel project;

  ProjectBox({required this.left, required this.width, required this.project});
}

class TimelineLaneAllocator {
  // 프로젝트를 레인별로 자동 배치
  static List<List<ProjectModel>> allocateToLanes(List<ProjectModel> projects) {
    // 시작 시간 순으로 정렬
    final sortedProjects = List<ProjectModel>.from(projects)..sort((a, b) {
      final aStart = a.startYear * 12 + a.startMonth;
      final bStart = b.startYear * 12 + b.startMonth;
      return aStart.compareTo(bStart);
    });

    List<List<ProjectModel>> lanes = [];

    for (var project in sortedProjects) {
      bool placed = false;

      // 기존 레인들을 순회하며 배치 가능한 레인 찾기
      for (var lane in lanes) {
        if (_canPlaceInLane(project, lane)) {
          lane.add(project);
          placed = true;
          break;
        }
      }

      // 배치 가능한 레인이 없으면 새 레인 생성
      if (!placed) {
        lanes.add([project]);
      }
    }

    return lanes;
  }

  // 해당 레인에 프로젝트를 배치할 수 있는지 확인
  static bool _canPlaceInLane(
    ProjectModel newProject,
    List<ProjectModel> lane,
  ) {
    for (var existingProject in lane) {
      if (_isOverlapping(newProject, existingProject)) {
        return false;
      }
    }
    return true;
  }

  // 두 프로젝트의 기간이 겹치는지 확인
  static bool _isOverlapping(ProjectModel a, ProjectModel b) {
    final aStart = a.startYear * 12 + a.startMonth;
    final aEnd = a.endYear * 12 + a.endMonth;
    final bStart = b.startYear * 12 + b.startMonth;
    final bEnd = b.endYear * 12 + b.endMonth;

    // 겹치지 않는 경우: a가 b보다 완전히 앞에 있거나 뒤에 있을 때
    return !(aEnd < bStart || bEnd < aStart);
  }
}

// 계산 함수 (기존과 동일)
ProjectBox calculateProjectBox({
  required double viewWidth,
  required ProjectModel project,
  required int baseYear,
}) {
  final startMonthTotal =
      (project.startYear - baseYear) * 12 + project.startMonth - 1;
  final endMonthTotal =
      (project.endYear - baseYear) * 12 + project.endMonth - 1;
  final monthWidth = viewWidth / 12;

  final left = startMonthTotal * monthWidth;
  final width = (endMonthTotal - startMonthTotal + 1) * monthWidth;

  return ProjectBox(left: left, width: width, project: project);
}

// 사용 예시
class ProjectTimelineWidget extends StatelessWidget {
  final List<ProjectModel> allProjects;
  final double viewWidth;
  final int baseYear;

  const ProjectTimelineWidget({
    required this.allProjects,
    required this.viewWidth,
    required this.baseYear,
  });

  @override
  Widget build(BuildContext context) {
    // 자동으로 레인 배치
    final lanes = TimelineLaneAllocator.allocateToLanes(allProjects);
    print('test001, $lanes, $allProjects');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: _calculateTotalWidth(),
        child: Stack(
          children: [
            // 각 레인별로 프로젝트 그리기
            ...lanes.asMap().entries.expand((entry) {
              final laneIndex = entry.key;
              final laneProjects = entry.value;

              return laneProjects.map((project) {
                final box = calculateProjectBox(
                  viewWidth: viewWidth,
                  project: project,
                  baseYear: baseYear,
                );

                return Positioned(
                  left: box.left,
                  top: laneIndex * 100.0, // 레인 높이 100
                  child: AnimationAppear(
                    delayMs: 200 + laneIndex * 200,
                    child: MyContentsBox(
                      child: Container(
                        width: box.width,
                        height: 80,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: _getLaneColor(laneIndex),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            project.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
            }),
          ],
        ),
      ),
    );
  }

  Color _getLaneColor(int laneIndex) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];
    return colors[laneIndex % colors.length];
  }

  double _calculateTotalWidth() {
    // 전체 프로젝트의 최대 endYear를 찾아서 계산
    final maxYear = allProjects.fold(
      baseYear,
      (max, project) => project.endYear > max ? project.endYear : max,
    );
    return (maxYear - baseYear + 1) * viewWidth;
  }
}
