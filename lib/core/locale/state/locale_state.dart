import '../_index.dart';
part 'locale_state.freezed.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({required SupportedLocale state}) = _LocaleState;
  factory LocaleState.initial() =>
      const LocaleState(state: SupportedLocale.korean);
}

enum SupportedLocale {
  korean('ko', Locale('ko')),
  english('en', Locale('en'));

  final String code;
  final Locale locale;

  const SupportedLocale(this.code, this.locale);
}
