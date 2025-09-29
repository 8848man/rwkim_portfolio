import '../_index.dart';

Widget explainMyself(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimationAppear(
          delayMs: mainAnimationDelayMs + 200,
          duration: Duration(milliseconds: 700),
          child: myText(
            AboutMeString.upperString(context),
            style: TextStyle(
              color: mainDefaultColors,
              fontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(height: 4),
        AnimationAppear(
          delayMs: mainAnimationDelayMs + 800,
          duration: Duration(milliseconds: 700),
          child: myText(
            AboutMeString.lowerString(context),
            style: TextStyle(
              color: mainDefaultColors,
              fontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget personalInfo(BuildContext context) {
  final List<String> texts = [
    AboutMeString.name(context),
    AboutMeString.birthDate(context),
    AboutMeString.email(context),
    AboutMeString.bloodType(context),
    AboutMeString.mbti(context),
    AboutMeString.hobby(context),
  ];
  return MyContentsBox(
    child: Stack(
      children: [
        Padding(padding: EdgeInsets.all(16), child: appearScrollView(texts)),
        Positioned(
          child: MyContentsBox(
            child: myText(
              AboutMeString.information(context),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget description(BuildContext context) {
  final List<String> texts = [
    AboutMeString.education(context),
    AboutMeString.major(context),
    AboutMeString.qualifications(context),
    AboutMeString.award(context),
  ];
  return MyContentsBox(
    child: Stack(
      children: [
        Padding(padding: EdgeInsets.all(16), child: appearScrollView(texts)),
        Positioned(
          left: 2,
          top: 2,
          child: MyContentsBox(
            child: myText(
              AboutMeString.experience(context),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget profilePicture() {
  return MyContentsBox(
    child: Positioned.fill(
      child: Image.asset(
        "assets/images/profile_image.png",
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    ),
  ).sizedBox(height: double.infinity);
}
