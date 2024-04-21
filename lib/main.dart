import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/editprofile_page.dart';
import 'package:login/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_page.dart';
import 'restaurantabout_.dart';
import 'search_page.dart';
import 'notification_page.dart';
import "post_page.dart";
import "viewpost_page.dart";
import "home_page.dart";
import "reviewmap_page.dart";
import "map.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
      // Route Configure
      routes: <RouteBase>[
        GoRoute(
          path: "firstpage",
          builder: (BuildContext context, GoRouterState state) {
            return MyHomePage();
          },
        ),
        GoRoute(
          path: "profile",
          builder: (BuildContext context, GoRouterState state) {
            return ProfilePage();
          },
        ),
        GoRoute(
          path: "editprofile",
          builder: (BuildContext context, GoRouterState state) {
            return EditProfilePage();
          },
        ),
        GoRoute(
          path: "notification",
          builder: (BuildContext context, GoRouterState state) {
            return NotificationPage();
          },
        ),
        GoRoute(
          path: "search",
          builder: (BuildContext context, GoRouterState state) {
            return SearchScreen();
          },
        ),
        GoRoute(
          path: "restaurant",
          builder: (BuildContext context, GoRouterState state) {
            return TabBarinfo();
          },
        ),
        GoRoute(
          path: "post",
          builder: (BuildContext context, GoRouterState state) {
            return Postpage();
          },
        ),
        GoRoute(
          path: "viewpost",
          builder: (BuildContext context, GoRouterState state) {
            return ViewPostPage();
          },
        ),
        GoRoute(
          path: "login",
          builder: (BuildContext context, GoRouterState state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: "reviewmap",
          builder: (BuildContext context, GoRouterState state) {
            return reviewmap();
          },
        ),
        GoRoute(
          path: "MapScreen",
          builder: (BuildContext context, GoRouterState state) {
            return MapScreen();
          },
        ),
      ],
    ),
  ],
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

