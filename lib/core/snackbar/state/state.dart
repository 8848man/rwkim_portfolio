import '../_index.dart';
part 'state.freezed.dart';

@freezed
class SnackBarState with _$SnackBarState {
  const factory SnackBarState({
    @Default('') String message,
    @Default(false) bool isShow,
    @Default(2) int durationSec,
  }) = _SnackBarState;
}
