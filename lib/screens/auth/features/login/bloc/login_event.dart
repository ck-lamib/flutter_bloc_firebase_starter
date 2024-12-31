part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailPasswordSubmitted extends LoginEvent {
  final String email;
  final String password;
  const LoginWithEmailPasswordSubmitted({
    required this.email,
    required this.password,
  });
}

class LoginWithGoogleSubmitted extends LoginEvent {
  const LoginWithGoogleSubmitted();
}
