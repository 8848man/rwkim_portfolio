import '../_index.dart';

class TendencyDialog extends StatelessWidget {
  final String heroTag;
  final Tendency data;
  const TendencyDialog({super.key, required this.heroTag, required this.data});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final bool isMobile = deviceWidth < mobileWidth;
    return InkWell(
      onTap: () => Future.microtask(() => Navigator.of(context).pop()),
      child: Material(
        color: Colors.black54.withOpacity(0.3), // 다이얼로그 배경
        child: Center(
          child: Hero(
            tag: heroTag,
            child: GestureDetector(
              onTap: () {}, // 다이얼로그 내부 탭 시 닫히지 않도록 이벤트 소모
              child: Stack(
                children: [
                  backgroundImage(),
                  SizedBox(
                    width: isMobile == true ? 240 : 400,
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          title('${data.type} ${data.score}%'),
                          contents(data.description),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget backgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/note_image.jpg",
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }

  Widget title(String title) {
    return Container(
      padding: EdgeInsets.only(top: 14),
      height: 100,
      child: Text(title, style: TextStyle(fontSize: 26)),
    );
  }

  Widget contents(String description) {
    return Container(padding: EdgeInsets.all(24), child: Text(description));
    ;
  }
}
