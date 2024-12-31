import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/logger_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/data/mapper/auth_mapper.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/exception/authentication_exception.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository(
    this._firebaseAuth,
    this._googleSignIn,
  );

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final CustomLogger _log = CustomLogger(title: "Firebase Auth Repo");

  @override
  Future<void> createUser({
    required AuthUserEntity user,
    required String password,
  }) async {
    try {
      // Create user with email and password
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: password,
      );

      final User? currentUser = userCredential.user;

      if (currentUser != null) {
        // Update the user's display name
        await currentUser.updateDisplayName(user.userName);

        // Send email verification if not already verified
        if (!currentUser.emailVerified) {
          try {
            await currentUser.sendEmailVerification();
          } catch (e) {
            _log.i('Error sending email verification: ${e.toString()}');
          }
        }
      }
    } on FirebaseAuthException catch (error) {
      // Handle Firebase-specific errors
      switch (error.code) {
        case 'weak-password':
          throw AuthenticationException('The password provided is too weak.');
        case 'email-already-in-use':
          throw AuthenticationException(
              'The account already exists for that email.');
        default:
          throw AuthenticationException(error.message ?? error.code);
      }
    } catch (error, stackTrace) {
      // Log unexpected errors
      _log.i('Unexpected Error: $error');
      _log.i('Stack Trace: $stackTrace');
      throw AuthenticationException('An unexpected error occurred');
    }
  }

  @override
  Future<void> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw AuthenticationException('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        throw AuthenticationException('Wrong password provided for that user.');
      }
      throw AuthenticationException(error.message ?? error.code);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> loginWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw AuthenticationException('Google sign-in was canceled or failed');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      _log.i('FirebaseAuthException: ${error.code}');
      await _googleSignIn.signOut();
      throw AuthenticationException(error.message ?? error.code);
    } on Exception catch (_) {
      rethrow;
    } catch (error) {
      await _googleSignIn.signOut();
      throw AuthenticationException('An unexpected error occurred');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<User?> getCurrentAuthUserState() {
    return _firebaseAuth.authStateChanges().map(
      (authUser) {
        _log.i("user data is : $authUser");
        return authUser;
      },
    );
  }

  @override
  AuthUserEntity? getLoggedInUser() {
    return _firebaseAuth.currentUser?.toUserEntity();
  }
}
