import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/data/mapper/auth_mapper.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/get_current_auth_state_use_case.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/get_logged_in_user_use_case.dart';
import 'package:flutter_bloc_firebase_starter/screens/auth/domain/use_case/logout_use_case.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/no_params.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._getLoggedInUserUseCase,
    this._getAuthStateUseCase,
    this._logoutUseCase,
  ) : super(
          const AuthInitial(),
        ) {
    on<AuthInitialCheckRequested>(_onInitialAuthChecked);
    on<AuthOnCurrentUserChanged>(_onCurrentUserChanged);
    on<AuthLogoutButtonPressed>(_onLogoutButtonPressed);

    _startUserSubscription();
  }

  final GetLoggedInUserUseCase _getLoggedInUserUseCase;
  final GetCurrentAuthStateUseCase _getAuthStateUseCase;
  final LogoutUseCase _logoutUseCase;

  late final StreamSubscription<firebase_auth.User?>? _authSubscription;

  void _startUserSubscription() {
    _authSubscription = _getAuthStateUseCase.execute(NoParams()).listen(
          (firebaseUser) => add(AuthOnCurrentUserChanged(
            firebaseUser?.toUserEntity(),
          )),
        );
  }

  Future<void> _onInitialAuthChecked(
    AuthInitialCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    AuthUserEntity? signedInUser = _getLoggedInUserUseCase.execute(NoParams());
    signedInUser != null
        ? emit(AuthUserAuthenticated(signedInUser))
        : emit(const AuthUserUnauthenticated());
  }

  Future<void> _onCurrentUserChanged(
    AuthOnCurrentUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    event.user != null
        ? emit(AuthUserAuthenticated(event.user!))
        : emit(const AuthUserUnauthenticated());
  }

  Future<void> _onLogoutButtonPressed(
    AuthLogoutButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    await _logoutUseCase.execute(NoParams());
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
