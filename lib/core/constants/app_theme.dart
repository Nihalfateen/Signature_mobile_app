

import '../../fileExport.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,

    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder( ),
    }),
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.transparent,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //
    //       statusBarBrightness: Brightness.dark,
    //       statusBarIconBrightness: Brightness.light),
    //   elevation: 0,
    //   centerTitle: true,
    // ),
    fontFamily: 'SST',
    primaryColor: AppColors.orange1,
    hintColor: AppColors.orange1,
    cardColor: AppColors.white1,
    brightness: Brightness.light,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: AppColors.white2,

    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.gray3,
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,

      ),
      displayMedium: TextStyle(
        color: AppColors.gray3,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: AppColors.gray2,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.gray3,
        fontSize: 17.sp,
        fontWeight: FontWeight.w300,
      ),
      labelSmall: TextStyle(
        color: AppColors.gray2.withOpacity(.4),
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColors.white1,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: AppColors.orange0,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.orange0,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: AppColors.gray3,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
