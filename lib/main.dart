import 'package:axen_tech_assignment/core/di/injector.dart';
import 'package:axen_tech_assignment/core/routes/router.dart';
import 'package:axen_tech_assignment/core/theme/constant/app_theme.dart';
import 'package:axen_tech_assignment/features/setting/cubit/theme_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ThemeSelectorCubit>(),
      child: BlocBuilder<ThemeSelectorCubit, ThemeMode>(
        builder: (blocContext, themeMode) {
          return MaterialApp.router(
            builder: (BuildContext context, Widget? child) => child!,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            title: "Tasky",
          );
        },
      ),
    );
  }
}
