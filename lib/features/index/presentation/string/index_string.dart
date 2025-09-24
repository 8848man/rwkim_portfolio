import '../_index.dart';

/// Home feature에서 사용할 번역 문자열 모음
class IndexStrings {
  /// "hello" 키 → 현재 locale에 맞는 번역 반환
  static String aboutMe(BuildContext context) =>
      AppLocalizations.of(context)!.aboutMe;
  static String skill(BuildContext context) =>
      AppLocalizations.of(context)!.skill;
  static String tendency(BuildContext context) =>
      AppLocalizations.of(context)!.tendency;
  static String projects(BuildContext context) =>
      AppLocalizations.of(context)!.projects;
  static String appealPoint(BuildContext context) =>
      AppLocalizations.of(context)!.appealPoint;
}
