import '../_index.dart';

Widget tendencyCard(
  BuildContext context, {
  String? heroTag,
  required Tendency data,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false, // 배경 투명하게 (다이얼로그처럼 보이게)
          barrierColor: Colors.black54, // 다이얼로그 배경색
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder:
              (_, __, ___) =>
                  TendencyDialog(heroTag: heroTag ?? '', data: data),
        ),
      );
    },
    child: Hero(
      tag: heroTag ?? '',
      child: MyContentsBox(
        child: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: tendencyProgressBar(score: data.score, name: data.type),
          ),
        ),
      ),
    ),
  );
}

Widget tendencyProgressBar({required double score, required String name}) {
  final ValueNotifier<double> valueNotifier = ValueNotifier(0);
  return DashedCircularProgressBar.aspectRatio(
    aspectRatio: 1, // width ÷ height
    valueNotifier: valueNotifier,
    progress: score,
    startAngle: 225,
    sweepAngle: 270,
    foregroundColor: Colors.green,
    backgroundColor: const Color(0xffeeeeee),
    foregroundStrokeWidth: 15,
    backgroundStrokeWidth: 15,
    animation: true,
    seekSize: 6,
    seekColor: const Color(0xffeeeeee),
    child: Center(
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder:
            (_, double value, __) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${value.toInt()}%',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xffeeeeee),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
      ),
    ),
  );
}

Widget tendencyExplainInteg(BuildContext context, List<Tendency> data) {
  return MyContentsBox(
    child: SingleChildScrollView(
      child: Column(
        children: List.generate(
          data.length,
          (index) => tendencyExplain(context, 'tendency$index', data[index]),
        ),
      ),
    ).sizedBox(height: double.infinity),
  );
}

Widget tendencyExplain(
  BuildContext context,
  String heroTag,
  Tendency tendency,
) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false, // 배경 투명하게 (다이얼로그처럼 보이게)
          barrierColor: Colors.black54, // 다이얼로그 배경색
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder:
              (_, __, ___) => TendencyDialog(heroTag: heroTag, data: tendency),
        ),
      );
    },
    child: Hero(
      tag: heroTag,
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: MyContentsBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(tendency.description),
          ),
        ),
      ),
    ),
  );
}
