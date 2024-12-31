import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/no_params.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/exception/authentication_exception.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/login_with_email_password_use_case.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailPasswordUseCase _loginWithEmailPasswordUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  LoginBloc(
    this._loginWithEmailPasswordUseCase,
    this._loginWithGoogleUseCase,
  ) : super(const LoginState()) {
    on<LoginWithEmailPasswordSubmitted>(_onLoginWithEmailPasswordSubmitted);
    on<LoginWithGoogleSubmitted>(_onLoginWithGoogleSubmitted);
  }

  FutureOr<void> _onLoginWithEmailPasswordSubmitted(
      LoginWithEmailPasswordSubmitted event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        progressStatus: ProgressStatus.loading,
      ),
    );

    //do login here;
    try {
      await _loginWithEmailPasswordUseCase.execute(
        LoginWithEmailPasswordParams(
            email: event.email, password: event.password),
      );

      return emit(
        state.copyWith(
          progressStatus: ProgressStatus.success,
        ),
      );
    } on Exception catch (e) {
      return emit(
        state.copyWith(
          progressStatus: ProgressStatus.failure,
          error: e is AuthenticationException ? e.message : e.toString(),
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          progressStatus: ProgressStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onLoginWithGoogleSubmitted(
      LoginWithGoogleSubmitted event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        gmailProgressStatus: ProgressStatus.loading,
      ),
    );

    //do login here;
    try {
      await _loginWithGoogleUseCase.execute(NoParams());
      return emit(
        state.copyWith(
          gmailProgressStatus: ProgressStatus.success,
        ),
      );
    } on Exception catch (e) {
      return emit(
        state.copyWith(
          gmailProgressStatus: ProgressStatus.failure,
          error: e is AuthenticationException ? e.message : e.toString(),
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          gmailProgressStatus: ProgressStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }
}
