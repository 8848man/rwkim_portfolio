import '../_index.dart';

final _random = Random();

class SingleSkil extends StatelessWidget {
  final SkillModel skill;
  final MaterialColor colorSwatch; // 위젯마다 계열 고정

  SingleSkil({super.key, required this.skill})
    : colorSwatch =
          _materialSwatches[_random.nextInt(_materialSwatches.length)];

  // 사용 가능한 MaterialColor 계열
  static final List<MaterialColor> _materialSwatches = [
    Colors.blue,
    // Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.brown,
  ];
  @override
  Widget build(BuildContext context) {
    return MyContentsBox(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              skill.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            AnimatedIndicator(targetValue: skill.score / 100),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                skill.description,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            skillProjectRow(),
          ],
        ),
      ),
    );
  }

  Widget skillProjectRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: List.generate(skill.projects.length, (index) {
          // 블루 계열 색상에서 랜덤 추출
          final shades = [
            colorSwatch.shade100,
            colorSwatch.shade200,
            colorSwatch.shade300,
            colorSwatch.shade400,
            colorSwatch.shade500,
            colorSwatch.shade600,
            colorSwatch.shade700,
          ];
          final randomColor = shades[_random.nextInt(shades.length)];

          return Container(
            height: 16,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              color: randomColor,
            ),
            child: Text(skill.projects[index], style: TextStyle(fontSize: 12)),
          );
        }),
      ),
    );
  }
}

Widget singleSkillWidget(SkillModel skill) {
  return MyContentsBox(
    child: Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            skill.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          AnimatedIndicator(targetValue: skill.score / 100),
          Text(skill.description),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: List.generate(skill.projects.length, (index) {
                // 블루 계열 색상에서 랜덤 추출
                final shades = [
                  Colors.blue.shade100,
                  Colors.blue.shade200,
                  Colors.blue.shade300,
                  Colors.blue.shade400,
                  Colors.blue.shade500,
                  Colors.blue.shade600,
                  Colors.blue.shade700,
                ];
                final randomColor = shades[_random.nextInt(shades.length)];

                return Container(
                  width: 40,
                  height: 20,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    color: randomColor,
                  ),
                  child: Text(
                    skill.projects[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}

class AnimatedIndicator extends StatelessWidget {
  final double targetValue; // 최종 값 (0.0 ~ 1.0)
  const AnimatedIndicator({super.key, required this.targetValue});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: targetValue),
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 20,
                backgroundColor: Colors.grey[300]!.withOpacity(0.7),
                valueColor: AlwaysStoppedAnimation(
                  Colors.blue.withOpacity(0.7),
                ),
              ),
            ),
            Text(
              "${(value * 100).toStringAsFixed(0)}%", // ✅ 현재 진행률 표시
              style: const TextStyle(
                color: Colors.black,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
