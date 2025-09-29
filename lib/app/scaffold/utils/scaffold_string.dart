import '../_index.dart';

/// Home feature에서 사용할 번역 문자열 모음
class ScaffoldString {
  /// "hello" 키 → 현재 locale에 맞는 번역 반환
  static String createdBy(BuildContext context) =>
      AppLocalizations.of(context)!.createdBy;

  static String index(BuildContext context) =>
      AppLocalizations.of(context)!.index;
}
