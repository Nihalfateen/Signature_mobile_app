import 'package:tawqee3_mobile_app/feature/DashBoard_feature/domain/services/home_cubit.dart';
import 'package:tawqee3_mobile_app/feature/DashBoard_feature/views/main_screen/main_screen.dart';
import 'package:tawqee3_mobile_app/feature/auth_feature/views/screens/login_screen.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/domain/services/meetings_cubit.dart';
import 'package:tawqee3_mobile_app/feature/meetings_feature/views/meetings_screen/meetings_details_screen.dart';
import 'package:tawqee3_mobile_app/feature/notifications_feature/domain/notifications_cubit.dart';

import '../../feature/DashBoard_feature/views/dashboard_screen/home_screen.dart';
import '../../feature/auth_feature/domain/services/auth_cubit.dart';
import '../../feature/meetings_feature/views/meetings_screen/meeting_screen.dart';
import '../../feature/notifications_feature/views/notifications_screen.dart';
import '../../feature/profile_feature/views/profile_screen.dart';
import '../../fileExport.dart';

// class LoginInfo extends ChangeNotifier {
//   /// The username of login.
//   String get userName => _userName;
//   String _userName = '';
//
//   /// Whether a user has logged in.
//   bool home = false;
//
//   /// Logs in a user.
//
//
//   /// Logs out the current user.
//
// }

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final shellNavigatorMeetingsScreenKey =
    GlobalKey<NavigatorState>(debugLabel: 'MeetingsScreen');
final shellNavigatorNotificationsScreenKey =
    GlobalKey<NavigatorState>(debugLabel: ' NotificationsScreen');
final shellNavigatorProfileScreenKey =
    GlobalKey<NavigatorState>(debugLabel: ' ProfileScreen');
// final LoginInfo loginInfo = LoginInfo();

class AppRouter {
  static final route = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: RegisterScreen.route,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: RegisterScreen(),
          ),
        ),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return MainScreen(navigationShell);
            },
            branches: [
              // The route branch for the 1º Tab
              StatefulShellBranch(
                navigatorKey: shellNavigatorHomeKey,
                // Add this branch routes
                // each routes with its sub routes if available e.g feed/uuid/details
                routes: <RouteBase>[
                  GoRoute(
                      path: HomeScreen.route,
                      builder: (context, state) => BlocProvider(
                            create: (context) => HomeCubit(),
                            child: HomeScreen(),
                          )),
                ],
              ),
              StatefulShellBranch(
                  navigatorKey: shellNavigatorMeetingsScreenKey,
                  routes: <RouteBase>[
                    GoRoute(
                        path: MeetingsScreen.route,
                        builder: (context, state) => BlocProvider(
                              create: (context) => MeetingsCubit(),
                              child: MeetingsScreen(),
                            ),
                        routes: [
                          GoRoute(
                              path: MeetingsDetailsScreen.routePath,
                              name: MeetingsDetailsScreen.routeName,
                              builder: (context, state) =>
                                  MeetingsDetailsScreen(
                                    meetingId:
                                    state.pathParameters["meetingId"],
                                  )),
                        ]),
                  ]),
              StatefulShellBranch(
                  navigatorKey: shellNavigatorNotificationsScreenKey,
                  routes: <RouteBase>[
                    GoRoute(
                        path: NotificationsScreen.route,
                        builder: (context, state) =>  BlocProvider(
                          create: (context) => NotificationsCubit(),
                          child: NotificationsScreen(),
                        ),
                        routes: [

                        ]),
                  ]),
              StatefulShellBranch(
                  navigatorKey: shellNavigatorProfileScreenKey,
                  routes: <RouteBase>[
                    GoRoute(
                        path: ProfileScreen.route,
                        builder: (context, state) => ProfileScreen(),
                        routes: []),
                  ])
            ])
      ]);
}
