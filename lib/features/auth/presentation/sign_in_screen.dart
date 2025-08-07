import 'package:axen_tech_assignment/core/constant/mock_auth.dart';
import 'package:axen_tech_assignment/core/di/injector.dart';
import 'package:axen_tech_assignment/core/routes/router.dart';
import 'package:axen_tech_assignment/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:axen_tech_assignment/features/auth/utils/validator.dart';
import 'package:axen_tech_assignment/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignInScreen extends StatelessWidget with Validator {
  static const String routeName = '/sign-in';
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => injector<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            context.loaderOverlay.hide();
            context.goNamed(HomeScreen.routeName);
          } else if (state is SignInFailure) {
            context.loaderOverlay.hide();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is SignInLoading) {
            context.loaderOverlay.show();
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: Text('Sign In', style: theme.textTheme.displayMedium)),
              body: LoaderOverlay(
                overlayWidgetBuilder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Please enter your email address and password for Login.',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(height: 1.5),
                      ),
                      const SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: emailController,
                              validator: validateEmail,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: passwordController,
                              validator: validatePassword,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    content: Text(
                                      'This feature is not implemented yet.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                backgroundColor: theme.primaryColor,
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<SignInBloc>().add(
                                        SignInStarted(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Sign In',
                                  style:
                                      theme.textTheme.displayMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'You can use the following credentials for testing:',
                              style: theme.textTheme.displaySmall,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Email: $mockEmail',
                              style: theme.textTheme.displaySmall,
                            ),
                            Text(
                              'Password: $mockPassword',
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
