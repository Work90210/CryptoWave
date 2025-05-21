part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.loading() = _Loading;
  const factory HomePageState.loaded(List<CoinModel> coins) = _Loaded;
  const factory HomePageState.error(String message) = _Error;
}
