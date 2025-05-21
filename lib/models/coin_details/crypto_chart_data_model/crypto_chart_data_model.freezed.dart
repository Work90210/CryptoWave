// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_chart_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CryptoChartDataModel _$CryptoChartDataModelFromJson(Map<String, dynamic> json) {
  return _CryptoChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$CryptoChartDataModel {
  @JsonKey(fromJson: _convertToDataPointModels)
  List<DataPointModel> get prices => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
  List<DataPointModel> get marketCaps => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
  List<DataPointModel> get totalVolumes => throw _privateConstructorUsedError;

  /// Serializes this CryptoChartDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CryptoChartDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CryptoChartDataModelCopyWith<CryptoChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoChartDataModelCopyWith<$Res> {
  factory $CryptoChartDataModelCopyWith(
    CryptoChartDataModel value,
    $Res Function(CryptoChartDataModel) then,
  ) = _$CryptoChartDataModelCopyWithImpl<$Res, CryptoChartDataModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _convertToDataPointModels) List<DataPointModel> prices,
    @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
    List<DataPointModel> marketCaps,
    @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
    List<DataPointModel> totalVolumes,
  });
}

/// @nodoc
class _$CryptoChartDataModelCopyWithImpl<
  $Res,
  $Val extends CryptoChartDataModel
>
    implements $CryptoChartDataModelCopyWith<$Res> {
  _$CryptoChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CryptoChartDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
    Object? marketCaps = null,
    Object? totalVolumes = null,
  }) {
    return _then(
      _value.copyWith(
            prices:
                null == prices
                    ? _value.prices
                    : prices // ignore: cast_nullable_to_non_nullable
                        as List<DataPointModel>,
            marketCaps:
                null == marketCaps
                    ? _value.marketCaps
                    : marketCaps // ignore: cast_nullable_to_non_nullable
                        as List<DataPointModel>,
            totalVolumes:
                null == totalVolumes
                    ? _value.totalVolumes
                    : totalVolumes // ignore: cast_nullable_to_non_nullable
                        as List<DataPointModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CryptoChartDataModelImplCopyWith<$Res>
    implements $CryptoChartDataModelCopyWith<$Res> {
  factory _$$CryptoChartDataModelImplCopyWith(
    _$CryptoChartDataModelImpl value,
    $Res Function(_$CryptoChartDataModelImpl) then,
  ) = __$$CryptoChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _convertToDataPointModels) List<DataPointModel> prices,
    @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
    List<DataPointModel> marketCaps,
    @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
    List<DataPointModel> totalVolumes,
  });
}

/// @nodoc
class __$$CryptoChartDataModelImplCopyWithImpl<$Res>
    extends _$CryptoChartDataModelCopyWithImpl<$Res, _$CryptoChartDataModelImpl>
    implements _$$CryptoChartDataModelImplCopyWith<$Res> {
  __$$CryptoChartDataModelImplCopyWithImpl(
    _$CryptoChartDataModelImpl _value,
    $Res Function(_$CryptoChartDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CryptoChartDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
    Object? marketCaps = null,
    Object? totalVolumes = null,
  }) {
    return _then(
      _$CryptoChartDataModelImpl(
        prices:
            null == prices
                ? _value._prices
                : prices // ignore: cast_nullable_to_non_nullable
                    as List<DataPointModel>,
        marketCaps:
            null == marketCaps
                ? _value._marketCaps
                : marketCaps // ignore: cast_nullable_to_non_nullable
                    as List<DataPointModel>,
        totalVolumes:
            null == totalVolumes
                ? _value._totalVolumes
                : totalVolumes // ignore: cast_nullable_to_non_nullable
                    as List<DataPointModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoChartDataModelImpl implements _CryptoChartDataModel {
  const _$CryptoChartDataModelImpl({
    @JsonKey(fromJson: _convertToDataPointModels)
    required final List<DataPointModel> prices,
    @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
    required final List<DataPointModel> marketCaps,
    @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
    required final List<DataPointModel> totalVolumes,
  }) : _prices = prices,
       _marketCaps = marketCaps,
       _totalVolumes = totalVolumes;

  factory _$CryptoChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoChartDataModelImplFromJson(json);

  final List<DataPointModel> _prices;
  @override
  @JsonKey(fromJson: _convertToDataPointModels)
  List<DataPointModel> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  final List<DataPointModel> _marketCaps;
  @override
  @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
  List<DataPointModel> get marketCaps {
    if (_marketCaps is EqualUnmodifiableListView) return _marketCaps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_marketCaps);
  }

  final List<DataPointModel> _totalVolumes;
  @override
  @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
  List<DataPointModel> get totalVolumes {
    if (_totalVolumes is EqualUnmodifiableListView) return _totalVolumes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalVolumes);
  }

  @override
  String toString() {
    return 'CryptoChartDataModel(prices: $prices, marketCaps: $marketCaps, totalVolumes: $totalVolumes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoChartDataModelImpl &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            const DeepCollectionEquality().equals(
              other._marketCaps,
              _marketCaps,
            ) &&
            const DeepCollectionEquality().equals(
              other._totalVolumes,
              _totalVolumes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_prices),
    const DeepCollectionEquality().hash(_marketCaps),
    const DeepCollectionEquality().hash(_totalVolumes),
  );

  /// Create a copy of CryptoChartDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoChartDataModelImplCopyWith<_$CryptoChartDataModelImpl>
  get copyWith =>
      __$$CryptoChartDataModelImplCopyWithImpl<_$CryptoChartDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoChartDataModelImplToJson(this);
  }
}

abstract class _CryptoChartDataModel implements CryptoChartDataModel {
  const factory _CryptoChartDataModel({
    @JsonKey(fromJson: _convertToDataPointModels)
    required final List<DataPointModel> prices,
    @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
    required final List<DataPointModel> marketCaps,
    @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
    required final List<DataPointModel> totalVolumes,
  }) = _$CryptoChartDataModelImpl;

  factory _CryptoChartDataModel.fromJson(Map<String, dynamic> json) =
      _$CryptoChartDataModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _convertToDataPointModels)
  List<DataPointModel> get prices;
  @override
  @JsonKey(name: 'market_caps', fromJson: _convertToDataPointModels)
  List<DataPointModel> get marketCaps;
  @override
  @JsonKey(name: 'total_volumes', fromJson: _convertToDataPointModels)
  List<DataPointModel> get totalVolumes;

  /// Create a copy of CryptoChartDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoChartDataModelImplCopyWith<_$CryptoChartDataModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DataPointModel _$DataPointModelFromJson(Map<String, dynamic> json) {
  return _DataPointModel.fromJson(json);
}

/// @nodoc
mixin _$DataPointModel {
  int get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Serializes this DataPointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataPointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataPointModelCopyWith<DataPointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPointModelCopyWith<$Res> {
  factory $DataPointModelCopyWith(
    DataPointModel value,
    $Res Function(DataPointModel) then,
  ) = _$DataPointModelCopyWithImpl<$Res, DataPointModel>;
  @useResult
  $Res call({int timestamp, double value});
}

/// @nodoc
class _$DataPointModelCopyWithImpl<$Res, $Val extends DataPointModel>
    implements $DataPointModelCopyWith<$Res> {
  _$DataPointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataPointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as int,
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DataPointModelImplCopyWith<$Res>
    implements $DataPointModelCopyWith<$Res> {
  factory _$$DataPointModelImplCopyWith(
    _$DataPointModelImpl value,
    $Res Function(_$DataPointModelImpl) then,
  ) = __$$DataPointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timestamp, double value});
}

/// @nodoc
class __$$DataPointModelImplCopyWithImpl<$Res>
    extends _$DataPointModelCopyWithImpl<$Res, _$DataPointModelImpl>
    implements _$$DataPointModelImplCopyWith<$Res> {
  __$$DataPointModelImplCopyWithImpl(
    _$DataPointModelImpl _value,
    $Res Function(_$DataPointModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DataPointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? value = null}) {
    return _then(
      _$DataPointModelImpl(
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as int,
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPointModelImpl implements _DataPointModel {
  const _$DataPointModelImpl({required this.timestamp, required this.value});

  factory _$DataPointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPointModelImplFromJson(json);

  @override
  final int timestamp;
  @override
  final double value;

  @override
  String toString() {
    return 'DataPointModel(timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPointModelImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value);

  /// Create a copy of DataPointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPointModelImplCopyWith<_$DataPointModelImpl> get copyWith =>
      __$$DataPointModelImplCopyWithImpl<_$DataPointModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPointModelImplToJson(this);
  }
}

abstract class _DataPointModel implements DataPointModel {
  const factory _DataPointModel({
    required final int timestamp,
    required final double value,
  }) = _$DataPointModelImpl;

  factory _DataPointModel.fromJson(Map<String, dynamic> json) =
      _$DataPointModelImpl.fromJson;

  @override
  int get timestamp;
  @override
  double get value;

  /// Create a copy of DataPointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataPointModelImplCopyWith<_$DataPointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
