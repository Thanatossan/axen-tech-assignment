import 'package:axen_tech_assignment/features/auth/presentation/sign_in_screen.dart';
import 'package:axen_tech_assignment/features/home/presentation/widget/task_card.dart';
import 'package:axen_tech_assignment/features/home/presentation/widget/task_in_progress_card.dart';
import 'package:axen_tech_assignment/features/setting/presentation/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Menu',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              ListTile(
                title: Text('Settings',
                    style: Theme.of(context).textTheme.displayMedium),
                onTap: () {
                  context.pushNamed(
                      SettingScreen.routeName); // Navigate to settings screen
                },
              ),
              ListTile(
                title: Text('Logout',
                    style: Theme.of(context).textTheme.displayMedium),
                onTap: () {
                  context.goNamed(
                      SignInScreen.routeName); // Navigate to sign-in screen
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens the drawer
                },
              );
            },
          ),
          title: Text(DateFormat('MMM, d').format(DateTime.now()),
              style: Theme.of(context).textTheme.displayMedium),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
                child: SizedBox(
                  width: 236,
                  child: Text(
                    'Let’s make a habits together  🙌',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16.0),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5, // Example count
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(
                        width: 10,
                      );
                    }
                    // Mock data for demonstration
                    return const TaskCard(
                      title: 'Application Design',
                      description: 'Design the application architecture',
                      progress: 0.5,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'In Progress',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        // Chevron icon for more options
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('More options coming soon!',
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                duration: Duration(seconds: 2),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3, // Example count
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0),
                      itemBuilder: (context, index) {
                        // Mock data for demonstration
                        return const TaskInProgressCard(
                          progressPercentage: 0.5,
                          title: 'Productivity Mobile App',
                          subtitle: 'Create Detail Booking',
                          timeAgo: '2 min ago',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
