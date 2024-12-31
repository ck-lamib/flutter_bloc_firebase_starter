import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class LoginWithEmailPasswordUseCase
    extends UseCase<Future<void>, LoginWithEmailPasswordParams> {
  LoginWithEmailPasswordUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future<void> execute(LoginWithEmailPasswordParams params) async {
    return _authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginWithEmailPasswordParams extends Equatable {
  const LoginWithEmailPasswordParams(
      {required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
