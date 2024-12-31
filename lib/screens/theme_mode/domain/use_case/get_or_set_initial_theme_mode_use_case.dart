import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/repository/theme_mode_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class GetOrSetInitialThemeModeUseCase
    extends UseCase<int, GetOrSetInitialThemeModeUseCaseParams> {
  GetOrSetInitialThemeModeUseCase(
    this._themeModeRepository,
  );

  final ThemeModeRepository _themeModeRepository;

  @override
  Future<int> execute(GetOrSetInitialThemeModeUseCaseParams params) async {
    return await _themeModeRepository.getOrSetInitialThemeModeIndex(
      params.currentThemeModeId,
    );
  }
}

class GetOrSetInitialThemeModeUseCaseParams extends Equatable {
  const GetOrSetInitialThemeModeUseCaseParams({
    required this.currentThemeModeId,
  });

  final int currentThemeModeId;

  @override
  List<Object?> get props => [
        currentThemeModeId,
      ];
}
