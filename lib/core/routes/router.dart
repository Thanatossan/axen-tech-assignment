import 'package:axen_tech_assignment/features/auth/presentation/sign_in_screen.dart';
import 'package:axen_tech_assignment/features/home/presentation/home_screen.dart';
import 'package:axen_tech_assignment/features/setting/presentation/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: SignInScreen.routeName, routes: [
  GoRoute(
      path: SignInScreen.routeName,
      name: SignInScreen.routeName,
      builder: (context, state) => SignInScreen()),
  GoRoute(
      path: HomeScreen.routeName,
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen()),
  GoRoute(
      path: SettingScreen.routeName,
      name: SettingScreen.routeName,
      builder: (context, state) => SettingScreen()),
]);
