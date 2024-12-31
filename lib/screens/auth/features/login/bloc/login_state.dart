part of 'login_bloc.dart';

class LoginState extends Equatable {
  final ProgressStatus progressStatus;
  final ProgressStatus gmailProgressStatus;
  final String? error;
  const LoginState({
    this.progressStatus = ProgressStatus.initial,
    this.gmailProgressStatus = ProgressStatus.initial,
    this.error,
  });

  LoginState copyWith({
    ProgressStatus? progressStatus,
    ProgressStatus? gmailProgressStatus,
    String? error,
  }) {
    return LoginState(
      progressStatus: progressStatus ?? this.progressStatus,
      gmailProgressStatus: gmailProgressStatus ?? this.gmailProgressStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        progressStatus,
        gmailProgressStatus,
        error,
      ];
}
