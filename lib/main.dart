import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/routing/app_route.dart';
import 'package:flutter_firebase/theme/app_theme.dart';
import 'package:flutter_firebase/theme/theme_provider.dart';
import 'package:flutter_firebase/utils/preferences_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  final isLightMode = await PreferencesUtils.getBool(key: PrefKeys.IS_DARK_MODE);

  runApp(
    ProviderScope(
      overrides: [
        themesProvider.overrideWith((ref) => ThemesProvider(isLightMode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    final themeModeState = ref.watch(themesProvider);
    return ScreenUtilInit(
      designSize: const Size(430.0, 932.0),
      // minTextAdapt: true,
      // splitScreenMode: true,
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeModeState,
        routeInformationParser: appRouter.routeInformationParser,
        routerDelegate: appRouter.routerDelegate,
        routeInformationProvider: appRouter.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase',
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);
          const maxTextScaleFactor = 0.98;
          final constrainedTextScaleFactor = mediaQuery.textScaleFactor > maxTextScaleFactor ? maxTextScaleFactor : mediaQuery.textScaleFactor;

          return MediaQuery(
            data: mediaQuery.copyWith(textScaler: TextScaler.linear(constrainedTextScaleFactor)),
            child: child ?? const SizedBox(),
          );
        },
      ),
    );
  }
}

