import '../_index.dart';

class SnackBarWrapper extends ConsumerWidget {
  final Widget child;
  const SnackBarWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SnackBarState>(snackBarStateProvider, (prev, next) {
      if (next.isShow && next.message.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            duration: Duration(seconds: next.durationSec),
          ),
        );

        // 보여준 뒤 상태 초기화
        ref.read(snackBarStateProvider.notifier).state = const SnackBarState();
      }
    });
    return child;
  }
}
