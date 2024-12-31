import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/no_params.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class GetCurrentAuthStateUseCase
    extends UseCase<Stream<firebase_auth.User?>, NoParams> {
  GetCurrentAuthStateUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Stream<firebase_auth.User?> execute(NoParams params) {
    return _authRepository.getCurrentAuthUserState();
  }
}
