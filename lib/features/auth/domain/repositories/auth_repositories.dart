import 'package:axen_tech_assignment/core/model/response.dart';

abstract class AuthRepository {
  Future<Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Response> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Response> signOut();
}
