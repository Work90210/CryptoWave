import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_model.freezed.dart';
part 'coin_model.g.dart';

@freezed
class CoinModel with _$CoinModel {
  const factory CoinModel({
    required String id,
    required String symbol,
    required String name,
    required String image,
    @JsonKey(name: 'current_price') required double currentPrice,
    @JsonKey(name: 'market_cap') required int marketCap,
    @JsonKey(name: 'market_cap_rank') required int marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation') required int? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') required int totalVolume,
    @JsonKey(name: 'high_24h') required double high24h,
    @JsonKey(name: 'low_24h') required double low24h,
    @JsonKey(name: 'price_change_24h') required double priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h') required double priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') required double marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h') required double marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') required double circulatingSupply,
    @JsonKey(name: 'total_supply') required double? totalSupply,
    @JsonKey(name: 'max_supply') required double? maxSupply,
    required double ath,
    @JsonKey(name: 'ath_change_percentage') required double athChangePercentage,
    @JsonKey(name: 'ath_date') required String athDate,
    required double atl,
    @JsonKey(name: 'atl_change_percentage') required double atlChangePercentage,
    @JsonKey(name: 'atl_date') required String atlDate,
    @JsonKey(name: 'last_updated') required String lastUpdated,
    RoiModel? roi,
  }) = _CoinModel;
  const CoinModel._();

  factory CoinModel.fromJson(Map<String, dynamic> json) => _$CoinModelFromJson(json);

  // Convenience getters
  DateTime get athDateTime => DateTime.parse(athDate);
  DateTime get atlDateTime => DateTime.parse(atlDate);
  DateTime get lastUpdatedDateTime => DateTime.parse(lastUpdated);

  String get formattedCurrentPrice => '\$${currentPrice.toStringAsFixed(2)}';
  String get formattedMarketCap => '\$${(marketCap / 1000000000).toStringAsFixed(2)}B';

  bool get isPriceUp => priceChange24h > 0;
  String get priceChangeSign => isPriceUp ? '+' : '';
  String get formattedPriceChangePercentage =>
      '$priceChangeSign${priceChangePercentage24h.toStringAsFixed(2)}%';
}

@freezed
class RoiModel with _$RoiModel {
  const factory RoiModel({
    required double times,
    required String currency,
    required double percentage,
  }) = _RoiModel;

  factory RoiModel.fromJson(Map<String, dynamic> json) => _$RoiModelFromJson(json);
}
