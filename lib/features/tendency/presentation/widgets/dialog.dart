import '../_index.dart';

class TendencyDialog extends StatelessWidget {
  final String heroTag;
  const TendencyDialog({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Future.microtask(() => Navigator.of(context).pop()),
      child: Material(
        color: Colors.black54.withOpacity(0.3), // 다이얼로그 배경
        child: Center(
          child: Hero(
            tag: heroTag,
            child: GestureDetector(
              onTap: () {}, // 다이얼로그 내부 탭 시 닫히지 않도록 이벤트 소모
              child: Container(width: 250, height: 250, color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
