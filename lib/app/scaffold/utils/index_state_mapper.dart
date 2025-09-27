import '../_index.dart';

extension IndexStateMapper on IndexState {
  String localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case IndexState.aboutMe:
        return l10n.aboutMe;
      case IndexState.tendency:
        return l10n.tendency;
      case IndexState.skill:
        return l10n.skill;
      case IndexState.projects:
        return l10n.projects;
      case IndexState.appealPoint:
        return l10n.appealPoint;
    }
  }
}
