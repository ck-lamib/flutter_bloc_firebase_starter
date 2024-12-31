import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class CreateUserUseCase extends UseCase<Future<void>, CreateUserParams> {
  CreateUserUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future<void> execute(CreateUserParams params) async {
    return await _authRepository.createUser(
      user: params.user,
      password: params.password,
    );
  }
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.user,
    required this.password,
  });

  final AuthUserEntity user;
  final String password;

  @override
  List<Object?> get props => [
        user,
        password,
      ];
}
