part of 'coin_details_cubit.dart';

@freezed
class CoinDetailsState with _$CoinDetailsState {
  const factory CoinDetailsState.loading() = _Loading;

  const factory CoinDetailsState.loaded({
    required CryptoChartDataModel coinDetails,
    required CoinModel coinModel,
  }) = _Loaded;

  const factory CoinDetailsState.error({required String message}) = _Error;
}
