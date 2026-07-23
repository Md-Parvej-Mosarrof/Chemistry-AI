import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/locale_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/storage/hive_service.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(
    const ProviderScope(
      child: ChemistryLearningApp(),
    ),
  );
}

class ChemistryLearningApp extends ConsumerWidget {
  const ChemistryLearningApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final localeNotifier = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Chemistry Learning',

      locale: localeNotifier.locale,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      routerConfig: appRouter,

      // Localization configuration
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
