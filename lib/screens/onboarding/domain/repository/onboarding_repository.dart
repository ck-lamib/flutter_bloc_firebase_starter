abstract class OnBoardingRepository {
  Future<bool> getOrSetInitialOnBoardingValue(bool defaultOnBardingValue);
  Future<void> setOnBardingValue(bool onBardingValue);
}
