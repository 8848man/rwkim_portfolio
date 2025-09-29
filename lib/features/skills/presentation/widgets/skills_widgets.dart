import '../_index.dart';

Widget singleSkillWidget(SkillModel skill) {
  return MyContentsBox(
    child:
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                skill.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              AnimatedIndicator(targetValue: 0.5),
              Text(skill.description),
              Text('projects'),
            ],
          ),
        ).expand(),
  );
}

class AnimatedIndicator extends StatelessWidget {
  final double targetValue; // 최종 값 (0.0 ~ 1.0)
  const AnimatedIndicator({super.key, required this.targetValue});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: targetValue),
      duration: const Duration(seconds: 2), // ✅ 애니메이션 시간
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: value, // ✅ 애니메이션 되는 값
            minHeight: 10,
            backgroundColor: Colors.grey[300]!.withOpacity(0.7),
            valueColor: AlwaysStoppedAnimation(Colors.blue.withOpacity(0.7)),
          ),
        );
      },
    );
  }
}
