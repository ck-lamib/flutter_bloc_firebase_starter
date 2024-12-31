import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/theme_mode/domain/repository/theme_mode_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/use_cases/use_case.dart';

@injectable
class SetThemeModeUseCase extends UseCase<void, SetThemeModeUseCaseParams> {
  SetThemeModeUseCase(
    this._themeModeRepository,
  );

  final ThemeModeRepository _themeModeRepository;

  @override
  void execute(SetThemeModeUseCaseParams params) {
    _themeModeRepository.setThemeMode(params.themeModeIndex);
  }
}

class SetThemeModeUseCaseParams extends Equatable {
  const SetThemeModeUseCaseParams({
    required this.themeModeIndex,
  });

  final int themeModeIndex;

  @override
  List<Object?> get props => [
        themeModeIndex,
      ];
}
