import 'package:injectable/injectable.dart';

import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/no_params.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class LogoutUseCase extends UseCase<Future<void>, NoParams> {
  LogoutUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future<void> execute(NoParams params) {
    return _authRepository.logout();
  }
}
