import '../_index.dart';

class AppealPointScreen extends ConsumerWidget {
  const AppealPointScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(indexStateProvider.notifier).state = IndexState.appealPoint;
    });
    return Container(child: Center(child: Text("appeal point")));
  }
}
