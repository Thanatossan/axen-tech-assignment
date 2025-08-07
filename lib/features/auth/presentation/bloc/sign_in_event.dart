part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInStarted extends SignInEvent {
  const SignInStarted({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class SignInEmailChanged extends SignInEvent {
  const SignInEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}
