import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class SetOnBoardingValueUseCase
    extends UseCase<void, SetOnBoardingValueUseCaseParams> {
  SetOnBoardingValueUseCase(
    this._onBoardingRepository,
  );

  final OnBoardingRepository _onBoardingRepository;

  @override
  void execute(SetOnBoardingValueUseCaseParams params) {
    _onBoardingRepository.setOnBardingValue(params.onBoardingValue);
  }
}

class SetOnBoardingValueUseCaseParams extends Equatable {
  const SetOnBoardingValueUseCaseParams({
    required this.onBoardingValue,
  });

  final bool onBoardingValue;

  @override
  List<Object?> get props => [
        onBoardingValue,
      ];
}
