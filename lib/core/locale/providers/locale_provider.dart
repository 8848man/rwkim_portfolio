import '../_index.dart';

/// ✅ State + 로직을 한 곳에서 관리하는 Notifier
class LocaleNotifier extends StateNotifier<LocaleState> {
  LocaleNotifier() : super(LocaleState.initial());

  /// 로케일 변경
  void changeLocale(SupportedLocale newLocale) {
    if (state.state != newLocale) {
      state = LocaleState(state: newLocale);
    }
  }

  /// en <-> ko 토글 기능
  void toggleLocale() {
    state =
        state.state == SupportedLocale.korean
            ? LocaleState(state: SupportedLocale.english)
            : LocaleState(state: SupportedLocale.korean);
  }
}

/// ✅ 단일 Provider로 상태 + 로직 제공
final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleState>((
  ref,
) {
  return LocaleNotifier();
});
