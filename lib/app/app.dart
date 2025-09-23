import 'package:rw_portfolio/app/adaptor/public.dart';
import 'package:rw_portfolio/app/router/public.dart';
import 'package:rw_portfolio/app/common/packages.dart';

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(useMaterial3: true),
      builder: (context, child) {
        // MaterialApp 내부에서 ScaffoldMessenger가 보장됨
        return WrapperAdapter(
          wrappers: [
            (contents) => SnackBarWrapper(child: contents),
          ],
          child: child!,
        );
      },
    );
  }
}
