import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/editprofile_page.dart';
import 'package:login/profile_page.dart';

import 'login_page.dart'; // not complete 
import 'signup_page.dart'; // not complete
import 'setting_page.dart'; // not complete
import 'restaurantabout_.dart';
import 'search_page.dart';
import 'notification_page.dart';
import 'post_page.dart';
import 'viewpost_page.dart';


void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path:'/',
      builder: (BuildContext context, GoRouterState state ) {
        return LoginPage();
      },
      //TODO 2 Route Configure
      routes: <RouteBase> [
        GoRoute(
          path: "signup",
          builder: (BuildContext context, GoRouterState state) {
            return SignupPage();
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
          path: "setting",
          builder: (BuildContext context, GoRouterState state) {
            return SettingPage();
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
      ],  
      
    ),
  ],
);

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}