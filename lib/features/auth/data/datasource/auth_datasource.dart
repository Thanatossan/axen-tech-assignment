import 'package:axen_tech_assignment/core/constant/mock_auth.dart';
import 'package:axen_tech_assignment/core/model/response.dart';

abstract class AuthDataSource {
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

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (email != mockEmail || password != mockPassword) {
      return Response(statusCode: '401', message: 'Invalid email or password');
    }
    // Simulate a successful sign-in
    await Future.delayed(const Duration(seconds: 1));
    // You can add more logic here, such as saving user data or tokens
    return Response(statusCode: '200', message: 'Sign-in successful');
  }

  @override
  Future<Response> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    const mockEmail = "testLogin";
    if (email == mockEmail) {
      return Response(statusCode: '409', message: 'Email already in use');
    }
    // Simulate a successful sign-up
    await Future.delayed(const Duration(seconds: 1));
    return Response(statusCode: '201', message: 'Sign-up successful');
  }

  @override
  Future<Response> signOut() async {
    // Implementation for signing out
    await Future.delayed(const Duration(seconds: 1));
    return Response(statusCode: '200', message: 'Sign-out successful');
  }
}
