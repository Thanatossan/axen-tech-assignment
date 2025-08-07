import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:axen_tech_assignment/features/auth/domain/usecase/sign_in_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;

  SignInBloc({required this.signInUseCase}) : super(const SignInInitial()) {
    on<SignInStarted>(_onSignInStarted);
  }

  Future<void> _onSignInStarted(
    SignInStarted event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInLoading());

    final params = SignInParams(
      email: event.email,
      password: event.password,
    );

    final result = await signInUseCase.call(params: params);

    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (success) => emit(const SignInSuccess()),
    );
  }
}
