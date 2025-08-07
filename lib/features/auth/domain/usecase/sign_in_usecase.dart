import 'package:dartz/dartz.dart';
import 'package:axen_tech_assignment/core/model/response.dart';
import 'package:axen_tech_assignment/core/usecase/usecase.dart';
import 'package:axen_tech_assignment/features/auth/domain/repositories/auth_repositories.dart';

class SignInUseCase implements UseCase<Either<Response, String>, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<Either<Response, String>> call({required SignInParams params}) async {
    final response = await _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    if (response.statusCode == '200') {
      return Right(response.message);
    } else {
      return Left(response);
    }
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
