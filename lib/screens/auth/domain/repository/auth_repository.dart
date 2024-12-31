import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';

abstract class AuthRepository {
  Future<void> createUser({
    required AuthUserEntity user,
    required String password,
  });
  Future<void> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<void> loginWithGoogle();
  Future<void> logout();
  Stream<firebase_auth.User?> getCurrentAuthUserState();
  AuthUserEntity? getLoggedInUser();
}
