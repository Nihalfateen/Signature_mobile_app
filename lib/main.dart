
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/config/app_cubits.dart';
import 'core/config/app_route.dart';
import 'core/config/observer.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_flavors.dart';
import 'core/constants/app_pathes.dart';
import 'core/constants/app_theme.dart';
import 'core/services/locator_service.dart';
import 'core/services/restart_app.dart';
import 'fileExport.dart';

const appFlavor =
String.fromEnvironment('flavor', defaultValue: AppFlavors.staging);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  await Preference.init();
  setupLocator();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runSignatureApp();
}
void runSignatureApp(){
  final app =  MultiBlocProvider(
    providers: AppCubits.appCubit(),
    child: EasyLocalization(
      path: localePath,
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale:  Locale('ar'),
      fallbackLocale: const Locale('ar'),
      saveLocale: true,
      child: RestartWidget(child: MyApp()),
    ),
  );
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,

      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

          child: MaterialApp.router(
            // localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            // locale: Locale( Preference.getString(PrefKeys.languageCode)??"ar"),
            // locale: context.locale,
            routerConfig: AppRouter.route,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppTheme.appTheme,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,

                  // platformBrightness: Brightness.dark
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }


}