part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState({
    this.progressStatus = ProgressStatus.initial,
    this.error = "",
  });

  final String? error;
  final ProgressStatus progressStatus;

  SignupState copyWith({
    ProgressStatus? progressStatus,
    String? error,
  }) {
    return SignupState(
      progressStatus: progressStatus ?? this.progressStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        progressStatus,
        error,
      ];
}
