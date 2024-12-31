import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_firebase_starter/screens/onboarding/domain/repository/onboarding_repository.dart';
import 'package:flutter_bloc_firebase_starter/utils/helpers/sharedpreferences_helper.dart';

@Injectable(as: OnBoardingRepository)
class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final SharedPreferencesHelper _pref = SharedPreferencesHelper();
  final _onBoardingIdKey = "onBoardingId";

  @override
  Future<bool> getOrSetInitialOnBoardingValue(
      bool defaultOnBardingValue) async {
    final storedOnBoardingValue = await _pref.getBool(_onBoardingIdKey);
    if (storedOnBoardingValue != null) {
      return storedOnBoardingValue;
    } else {
      await setOnBardingValue(defaultOnBardingValue);
      return defaultOnBardingValue;
    }
  }

  @override
  Future<void> setOnBardingValue(bool onBardingValue) async {
    await _pref.setBool(_onBoardingIdKey, onBardingValue);
  }
}
