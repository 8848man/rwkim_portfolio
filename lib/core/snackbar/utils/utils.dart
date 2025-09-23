import '../_index.dart';

void showSnackBar(Ref ref, String message, {int durationSec = 2}) {
  ref.read(snackBarStateProvider.notifier).state = SnackBarState(
    message: message,
    isShow: true,
    durationSec: durationSec,
  );
}

void hideSnackBar(Ref ref) {
  ref.read(snackBarStateProvider.notifier).state =
      const SnackBarState(isShow: false);
}
