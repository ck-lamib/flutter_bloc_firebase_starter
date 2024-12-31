import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/no_params.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class GetLoggedInUserUseCase extends UseCase<AuthUserEntity?, NoParams> {
  GetLoggedInUserUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  AuthUserEntity? execute(NoParams params) {
    return _authRepository.getLoggedInUser();
  }
}
