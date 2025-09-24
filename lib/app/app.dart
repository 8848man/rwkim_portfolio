import 'package:rw_portfolio/app/adaptor/public.dart';
import 'package:rw_portfolio/app/router/public.dart';
import 'package:rw_portfolio/app/common/packages.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rw_portfolio/core/locale/public.dart';
import 'package:rw_portfolio/l10n/app_localizations.dart' show AppLocalizations;

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(appRouterProvider);
    final LocaleState localeState = ref.watch(localeProvider);
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // 영어
        Locale('ko'), // 한국어
      ],
      locale: localeState.state.locale,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(useMaterial3: true),
      builder: (context, child) {
        // MaterialApp 내부에서 ScaffoldMessenger가 보장됨
        return WrapperAdapter(
          wrappers: [(contents) => SnackBarWrapper(child: contents)],
          child: child!,
        );
      },
    );
  }
}
