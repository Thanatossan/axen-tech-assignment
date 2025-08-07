import 'package:axen_tech_assignment/features/setting/cubit/theme_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/settings';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
  }

  void _toggleTheme() {
    BlocProvider.of<ThemeSelectorCubit>(context).toggleTheme();
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) => _toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
