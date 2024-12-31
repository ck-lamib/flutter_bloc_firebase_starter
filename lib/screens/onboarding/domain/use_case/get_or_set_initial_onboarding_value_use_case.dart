import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class GetOrSetInitialOnBoardingValueUseCase
    extends UseCase<bool, GetOrSetInitialOnBoardingValueUseCaseParams> {
  GetOrSetInitialOnBoardingValueUseCase(
    this._onBoardingRepository,
  );

  final OnBoardingRepository _onBoardingRepository;

  @override
  Future<bool> execute(
      GetOrSetInitialOnBoardingValueUseCaseParams params) async {
    return await _onBoardingRepository.getOrSetInitialOnBoardingValue(
      params.currentOnBoardingValue,
    );
  }
}

class GetOrSetInitialOnBoardingValueUseCaseParams extends Equatable {
  const GetOrSetInitialOnBoardingValueUseCaseParams({
    required this.currentOnBoardingValue,
  });

  final bool currentOnBoardingValue;

  @override
  List<Object?> get props => [
        currentOnBoardingValue,
      ];
}
