import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_work/core/navigator/index.dart';
import 'package:my_work/feature/screens/home/home_screen.dart';
import 'package:my_work/feature/screens/splash_screen.dart';
import 'package:my_work/generated/codegen_loader.g.dart';
import 'package:my_work/theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  FlutterNativeSplash.remove();
  
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom, MyTheme {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'My Work',
        theme: myTheme,
        navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        },
        home: const SplashScreen());
  }
}
