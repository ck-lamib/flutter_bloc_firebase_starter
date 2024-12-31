import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'bottom_navigation_state.dart';

@injectable
class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit()
      : super(
          const BottomNavigationState(currentIndex: 0),
        );

  void changePage(int index) {
    emit(BottomNavigationState(currentIndex: index));
  }
}
