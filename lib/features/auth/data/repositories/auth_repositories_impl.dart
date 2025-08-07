import 'package:axen_tech_assignment/core/model/response.dart';
import 'package:axen_tech_assignment/features/auth/data/datasource/auth_datasource.dart';
import 'package:axen_tech_assignment/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoriesImpl(this._authDataSource);

  @override
  Future<Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<Response> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<Response> signOut() {
    return _authDataSource.signOut();
  }
}
