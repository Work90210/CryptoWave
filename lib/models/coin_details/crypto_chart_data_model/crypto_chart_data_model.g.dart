// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_chart_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoChartDataModelImpl _$$CryptoChartDataModelImplFromJson(
  Map<String, dynamic> json,
) => _$CryptoChartDataModelImpl(
  prices: _convertToDataPointModels(json['prices'] as List),
  marketCaps: _convertToDataPointModels(json['market_caps'] as List),
  totalVolumes: _convertToDataPointModels(json['total_volumes'] as List),
);

Map<String, dynamic> _$$CryptoChartDataModelImplToJson(
  _$CryptoChartDataModelImpl instance,
) => <String, dynamic>{
  'prices': instance.prices,
  'market_caps': instance.marketCaps,
  'total_volumes': instance.totalVolumes,
};

_$DataPointModelImpl _$$DataPointModelImplFromJson(Map<String, dynamic> json) =>
    _$DataPointModelImpl(
      timestamp: (json['timestamp'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$DataPointModelImplToJson(
  _$DataPointModelImpl instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'value': instance.value,
};
