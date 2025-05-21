import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_chart_data_model.freezed.dart';
part 'crypto_chart_data_model.g.dart';

@freezed
class CryptoChartDataModel with _$CryptoChartDataModel {
  const factory CryptoChartDataModel({
    @JsonKey(fromJson: _convertToDataPointModels) required List<DataPointModel> prices,
    @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
    required List<DataPointModel> marketCaps,
    @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
    required List<DataPointModel> totalVolumes,
  }) = _CryptoChartDataModel;

  factory CryptoChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoChartDataModelFromJson(json);
}

List<DataPointModel> _convertToDataPointModels(List<dynamic> list) {
  return list
      .whereType<List<dynamic>>() // skip invalid entries
      .where((e) => e.length >= 2) // ensure at least [timestamp,value]
      .map(DataPointModel.fromJsonArray)
      .toList();
}

@freezed
class DataPointModel with _$DataPointModel {
  const factory DataPointModel({required int timestamp, required double value}) = _DataPointModel;

  factory DataPointModel.fromJson(Map<String, dynamic> json) => _$DataPointModelFromJson(json);

  // Custom constructor for array format from API
  static DataPointModel fromJsonArray(List<dynamic> json) {
    if (json.length < 2) {
      throw ArgumentError('Expected [timestamp, value], got $json');
    }
    return DataPointModel(timestamp: json[0] as int, value: (json[1] as num).toDouble());
  }
}
