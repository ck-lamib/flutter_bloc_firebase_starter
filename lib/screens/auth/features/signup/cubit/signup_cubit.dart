import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/exception/authentication_exception.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/create_user_use_case.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/enums.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final CreateUserUseCase _createUserUsecase;
  SignupCubit(
    this._createUserUsecase,
  ) : super(
          const SignupState(),
        );

  void createUser({
    required AuthUserEntity user,
    required String password,
  }) async {
    if (isClosed) return;
    emit(state.copyWith(progressStatus: ProgressStatus.loading));

    try {
      await _createUserUsecase.execute(
        CreateUserParams(user: user, password: password),
      );

      if (!isClosed) {
        emit(state.copyWith(progressStatus: ProgressStatus.success));
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            progressStatus: ProgressStatus.failure,
            error: e is AuthenticationException ? e.message : e.toString(),
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            progressStatus: ProgressStatus.failure,
            error: e.toString(),
          ),
        );
      }
    }
  }
}
