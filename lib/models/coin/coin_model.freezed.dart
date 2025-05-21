// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) {
  return _CoinModel.fromJson(json);
}

/// @nodoc
mixin _$CoinModel {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_price')
  double get currentPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_cap')
  int get marketCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_cap_rank')
  int get marketCapRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'fully_diluted_valuation')
  int? get fullyDilutedValuation => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_volume')
  int get totalVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'high_24h')
  double get high24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'low_24h')
  double get low24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_24h')
  double get priceChange24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_percentage_24h')
  double get priceChangePercentage24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_cap_change_24h')
  double get marketCapChange24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  double get marketCapChangePercentage24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'circulating_supply')
  double get circulatingSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_supply')
  double? get totalSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_supply')
  double? get maxSupply => throw _privateConstructorUsedError;
  double get ath => throw _privateConstructorUsedError;
  @JsonKey(name: 'ath_change_percentage')
  double get athChangePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'ath_date')
  String get athDate => throw _privateConstructorUsedError;
  double get atl => throw _privateConstructorUsedError;
  @JsonKey(name: 'atl_change_percentage')
  double get atlChangePercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'atl_date')
  String get atlDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  String get lastUpdated => throw _privateConstructorUsedError;
  RoiModel? get roi => throw _privateConstructorUsedError;

  /// Serializes this CoinModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinModelCopyWith<CoinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinModelCopyWith<$Res> {
  factory $CoinModelCopyWith(CoinModel value, $Res Function(CoinModel) then) =
      _$CoinModelCopyWithImpl<$Res, CoinModel>;
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    String image,
    @JsonKey(name: 'current_price') double currentPrice,
    @JsonKey(name: 'market_cap') int marketCap,
    @JsonKey(name: 'market_cap_rank') int marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation') int? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') int totalVolume,
    @JsonKey(name: 'high_24h') double high24h,
    @JsonKey(name: 'low_24h') double low24h,
    @JsonKey(name: 'price_change_24h') double priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    double priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') double marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    double marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') double circulatingSupply,
    @JsonKey(name: 'total_supply') double? totalSupply,
    @JsonKey(name: 'max_supply') double? maxSupply,
    double ath,
    @JsonKey(name: 'ath_change_percentage') double athChangePercentage,
    @JsonKey(name: 'ath_date') String athDate,
    double atl,
    @JsonKey(name: 'atl_change_percentage') double atlChangePercentage,
    @JsonKey(name: 'atl_date') String atlDate,
    @JsonKey(name: 'last_updated') String lastUpdated,
    RoiModel? roi,
  });

  $RoiModelCopyWith<$Res>? get roi;
}

/// @nodoc
class _$CoinModelCopyWithImpl<$Res, $Val extends CoinModel>
    implements $CoinModelCopyWith<$Res> {
  _$CoinModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? image = null,
    Object? currentPrice = null,
    Object? marketCap = null,
    Object? marketCapRank = null,
    Object? fullyDilutedValuation = freezed,
    Object? totalVolume = null,
    Object? high24h = null,
    Object? low24h = null,
    Object? priceChange24h = null,
    Object? priceChangePercentage24h = null,
    Object? marketCapChange24h = null,
    Object? marketCapChangePercentage24h = null,
    Object? circulatingSupply = null,
    Object? totalSupply = freezed,
    Object? maxSupply = freezed,
    Object? ath = null,
    Object? athChangePercentage = null,
    Object? athDate = null,
    Object? atl = null,
    Object? atlChangePercentage = null,
    Object? atlDate = null,
    Object? lastUpdated = null,
    Object? roi = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            currentPrice:
                null == currentPrice
                    ? _value.currentPrice
                    : currentPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            marketCap:
                null == marketCap
                    ? _value.marketCap
                    : marketCap // ignore: cast_nullable_to_non_nullable
                        as int,
            marketCapRank:
                null == marketCapRank
                    ? _value.marketCapRank
                    : marketCapRank // ignore: cast_nullable_to_non_nullable
                        as int,
            fullyDilutedValuation:
                freezed == fullyDilutedValuation
                    ? _value.fullyDilutedValuation
                    : fullyDilutedValuation // ignore: cast_nullable_to_non_nullable
                        as int?,
            totalVolume:
                null == totalVolume
                    ? _value.totalVolume
                    : totalVolume // ignore: cast_nullable_to_non_nullable
                        as int,
            high24h:
                null == high24h
                    ? _value.high24h
                    : high24h // ignore: cast_nullable_to_non_nullable
                        as double,
            low24h:
                null == low24h
                    ? _value.low24h
                    : low24h // ignore: cast_nullable_to_non_nullable
                        as double,
            priceChange24h:
                null == priceChange24h
                    ? _value.priceChange24h
                    : priceChange24h // ignore: cast_nullable_to_non_nullable
                        as double,
            priceChangePercentage24h:
                null == priceChangePercentage24h
                    ? _value.priceChangePercentage24h
                    : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
                        as double,
            marketCapChange24h:
                null == marketCapChange24h
                    ? _value.marketCapChange24h
                    : marketCapChange24h // ignore: cast_nullable_to_non_nullable
                        as double,
            marketCapChangePercentage24h:
                null == marketCapChangePercentage24h
                    ? _value.marketCapChangePercentage24h
                    : marketCapChangePercentage24h // ignore: cast_nullable_to_non_nullable
                        as double,
            circulatingSupply:
                null == circulatingSupply
                    ? _value.circulatingSupply
                    : circulatingSupply // ignore: cast_nullable_to_non_nullable
                        as double,
            totalSupply:
                freezed == totalSupply
                    ? _value.totalSupply
                    : totalSupply // ignore: cast_nullable_to_non_nullable
                        as double?,
            maxSupply:
                freezed == maxSupply
                    ? _value.maxSupply
                    : maxSupply // ignore: cast_nullable_to_non_nullable
                        as double?,
            ath:
                null == ath
                    ? _value.ath
                    : ath // ignore: cast_nullable_to_non_nullable
                        as double,
            athChangePercentage:
                null == athChangePercentage
                    ? _value.athChangePercentage
                    : athChangePercentage // ignore: cast_nullable_to_non_nullable
                        as double,
            athDate:
                null == athDate
                    ? _value.athDate
                    : athDate // ignore: cast_nullable_to_non_nullable
                        as String,
            atl:
                null == atl
                    ? _value.atl
                    : atl // ignore: cast_nullable_to_non_nullable
                        as double,
            atlChangePercentage:
                null == atlChangePercentage
                    ? _value.atlChangePercentage
                    : atlChangePercentage // ignore: cast_nullable_to_non_nullable
                        as double,
            atlDate:
                null == atlDate
                    ? _value.atlDate
                    : atlDate // ignore: cast_nullable_to_non_nullable
                        as String,
            lastUpdated:
                null == lastUpdated
                    ? _value.lastUpdated
                    : lastUpdated // ignore: cast_nullable_to_non_nullable
                        as String,
            roi:
                freezed == roi
                    ? _value.roi
                    : roi // ignore: cast_nullable_to_non_nullable
                        as RoiModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of CoinModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoiModelCopyWith<$Res>? get roi {
    if (_value.roi == null) {
      return null;
    }

    return $RoiModelCopyWith<$Res>(_value.roi!, (value) {
      return _then(_value.copyWith(roi: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoinModelImplCopyWith<$Res>
    implements $CoinModelCopyWith<$Res> {
  factory _$$CoinModelImplCopyWith(
    _$CoinModelImpl value,
    $Res Function(_$CoinModelImpl) then,
  ) = __$$CoinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    String image,
    @JsonKey(name: 'current_price') double currentPrice,
    @JsonKey(name: 'market_cap') int marketCap,
    @JsonKey(name: 'market_cap_rank') int marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation') int? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') int totalVolume,
    @JsonKey(name: 'high_24h') double high24h,
    @JsonKey(name: 'low_24h') double low24h,
    @JsonKey(name: 'price_change_24h') double priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    double priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') double marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    double marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') double circulatingSupply,
    @JsonKey(name: 'total_supply') double? totalSupply,
    @JsonKey(name: 'max_supply') double? maxSupply,
    double ath,
    @JsonKey(name: 'ath_change_percentage') double athChangePercentage,
    @JsonKey(name: 'ath_date') String athDate,
    double atl,
    @JsonKey(name: 'atl_change_percentage') double atlChangePercentage,
    @JsonKey(name: 'atl_date') String atlDate,
    @JsonKey(name: 'last_updated') String lastUpdated,
    RoiModel? roi,
  });

  @override
  $RoiModelCopyWith<$Res>? get roi;
}

/// @nodoc
class __$$CoinModelImplCopyWithImpl<$Res>
    extends _$CoinModelCopyWithImpl<$Res, _$CoinModelImpl>
    implements _$$CoinModelImplCopyWith<$Res> {
  __$$CoinModelImplCopyWithImpl(
    _$CoinModelImpl _value,
    $Res Function(_$CoinModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoinModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? image = null,
    Object? currentPrice = null,
    Object? marketCap = null,
    Object? marketCapRank = null,
    Object? fullyDilutedValuation = freezed,
    Object? totalVolume = null,
    Object? high24h = null,
    Object? low24h = null,
    Object? priceChange24h = null,
    Object? priceChangePercentage24h = null,
    Object? marketCapChange24h = null,
    Object? marketCapChangePercentage24h = null,
    Object? circulatingSupply = null,
    Object? totalSupply = freezed,
    Object? maxSupply = freezed,
    Object? ath = null,
    Object? athChangePercentage = null,
    Object? athDate = null,
    Object? atl = null,
    Object? atlChangePercentage = null,
    Object? atlDate = null,
    Object? lastUpdated = null,
    Object? roi = freezed,
  }) {
    return _then(
      _$CoinModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        currentPrice:
            null == currentPrice
                ? _value.currentPrice
                : currentPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        marketCap:
            null == marketCap
                ? _value.marketCap
                : marketCap // ignore: cast_nullable_to_non_nullable
                    as int,
        marketCapRank:
            null == marketCapRank
                ? _value.marketCapRank
                : marketCapRank // ignore: cast_nullable_to_non_nullable
                    as int,
        fullyDilutedValuation:
            freezed == fullyDilutedValuation
                ? _value.fullyDilutedValuation
                : fullyDilutedValuation // ignore: cast_nullable_to_non_nullable
                    as int?,
        totalVolume:
            null == totalVolume
                ? _value.totalVolume
                : totalVolume // ignore: cast_nullable_to_non_nullable
                    as int,
        high24h:
            null == high24h
                ? _value.high24h
                : high24h // ignore: cast_nullable_to_non_nullable
                    as double,
        low24h:
            null == low24h
                ? _value.low24h
                : low24h // ignore: cast_nullable_to_non_nullable
                    as double,
        priceChange24h:
            null == priceChange24h
                ? _value.priceChange24h
                : priceChange24h // ignore: cast_nullable_to_non_nullable
                    as double,
        priceChangePercentage24h:
            null == priceChangePercentage24h
                ? _value.priceChangePercentage24h
                : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
                    as double,
        marketCapChange24h:
            null == marketCapChange24h
                ? _value.marketCapChange24h
                : marketCapChange24h // ignore: cast_nullable_to_non_nullable
                    as double,
        marketCapChangePercentage24h:
            null == marketCapChangePercentage24h
                ? _value.marketCapChangePercentage24h
                : marketCapChangePercentage24h // ignore: cast_nullable_to_non_nullable
                    as double,
        circulatingSupply:
            null == circulatingSupply
                ? _value.circulatingSupply
                : circulatingSupply // ignore: cast_nullable_to_non_nullable
                    as double,
        totalSupply:
            freezed == totalSupply
                ? _value.totalSupply
                : totalSupply // ignore: cast_nullable_to_non_nullable
                    as double?,
        maxSupply:
            freezed == maxSupply
                ? _value.maxSupply
                : maxSupply // ignore: cast_nullable_to_non_nullable
                    as double?,
        ath:
            null == ath
                ? _value.ath
                : ath // ignore: cast_nullable_to_non_nullable
                    as double,
        athChangePercentage:
            null == athChangePercentage
                ? _value.athChangePercentage
                : athChangePercentage // ignore: cast_nullable_to_non_nullable
                    as double,
        athDate:
            null == athDate
                ? _value.athDate
                : athDate // ignore: cast_nullable_to_non_nullable
                    as String,
        atl:
            null == atl
                ? _value.atl
                : atl // ignore: cast_nullable_to_non_nullable
                    as double,
        atlChangePercentage:
            null == atlChangePercentage
                ? _value.atlChangePercentage
                : atlChangePercentage // ignore: cast_nullable_to_non_nullable
                    as double,
        atlDate:
            null == atlDate
                ? _value.atlDate
                : atlDate // ignore: cast_nullable_to_non_nullable
                    as String,
        lastUpdated:
            null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                    as String,
        roi:
            freezed == roi
                ? _value.roi
                : roi // ignore: cast_nullable_to_non_nullable
                    as RoiModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinModelImpl extends _CoinModel with DiagnosticableTreeMixin {
  const _$CoinModelImpl({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    @JsonKey(name: 'current_price') required this.currentPrice,
    @JsonKey(name: 'market_cap') required this.marketCap,
    @JsonKey(name: 'market_cap_rank') required this.marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation')
    required this.fullyDilutedValuation,
    @JsonKey(name: 'total_volume') required this.totalVolume,
    @JsonKey(name: 'high_24h') required this.high24h,
    @JsonKey(name: 'low_24h') required this.low24h,
    @JsonKey(name: 'price_change_24h') required this.priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    required this.priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h') required this.marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    required this.marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply') required this.circulatingSupply,
    @JsonKey(name: 'total_supply') required this.totalSupply,
    @JsonKey(name: 'max_supply') required this.maxSupply,
    required this.ath,
    @JsonKey(name: 'ath_change_percentage') required this.athChangePercentage,
    @JsonKey(name: 'ath_date') required this.athDate,
    required this.atl,
    @JsonKey(name: 'atl_change_percentage') required this.atlChangePercentage,
    @JsonKey(name: 'atl_date') required this.atlDate,
    @JsonKey(name: 'last_updated') required this.lastUpdated,
    this.roi,
  }) : super._();

  factory _$CoinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinModelImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final String image;
  @override
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @override
  @JsonKey(name: 'market_cap')
  final int marketCap;
  @override
  @JsonKey(name: 'market_cap_rank')
  final int marketCapRank;
  @override
  @JsonKey(name: 'fully_diluted_valuation')
  final int? fullyDilutedValuation;
  @override
  @JsonKey(name: 'total_volume')
  final int totalVolume;
  @override
  @JsonKey(name: 'high_24h')
  final double high24h;
  @override
  @JsonKey(name: 'low_24h')
  final double low24h;
  @override
  @JsonKey(name: 'price_change_24h')
  final double priceChange24h;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap_change_24h')
  final double marketCapChange24h;
  @override
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double marketCapChangePercentage24h;
  @override
  @JsonKey(name: 'circulating_supply')
  final double circulatingSupply;
  @override
  @JsonKey(name: 'total_supply')
  final double? totalSupply;
  @override
  @JsonKey(name: 'max_supply')
  final double? maxSupply;
  @override
  final double ath;
  @override
  @JsonKey(name: 'ath_change_percentage')
  final double athChangePercentage;
  @override
  @JsonKey(name: 'ath_date')
  final String athDate;
  @override
  final double atl;
  @override
  @JsonKey(name: 'atl_change_percentage')
  final double atlChangePercentage;
  @override
  @JsonKey(name: 'atl_date')
  final String atlDate;
  @override
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @override
  final RoiModel? roi;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CoinModel(id: $id, symbol: $symbol, name: $name, image: $image, currentPrice: $currentPrice, marketCap: $marketCap, marketCapRank: $marketCapRank, fullyDilutedValuation: $fullyDilutedValuation, totalVolume: $totalVolume, high24h: $high24h, low24h: $low24h, priceChange24h: $priceChange24h, priceChangePercentage24h: $priceChangePercentage24h, marketCapChange24h: $marketCapChange24h, marketCapChangePercentage24h: $marketCapChangePercentage24h, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, ath: $ath, athChangePercentage: $athChangePercentage, athDate: $athDate, atl: $atl, atlChangePercentage: $atlChangePercentage, atlDate: $atlDate, lastUpdated: $lastUpdated, roi: $roi)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CoinModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('currentPrice', currentPrice))
      ..add(DiagnosticsProperty('marketCap', marketCap))
      ..add(DiagnosticsProperty('marketCapRank', marketCapRank))
      ..add(DiagnosticsProperty('fullyDilutedValuation', fullyDilutedValuation))
      ..add(DiagnosticsProperty('totalVolume', totalVolume))
      ..add(DiagnosticsProperty('high24h', high24h))
      ..add(DiagnosticsProperty('low24h', low24h))
      ..add(DiagnosticsProperty('priceChange24h', priceChange24h))
      ..add(
        DiagnosticsProperty(
          'priceChangePercentage24h',
          priceChangePercentage24h,
        ),
      )
      ..add(DiagnosticsProperty('marketCapChange24h', marketCapChange24h))
      ..add(
        DiagnosticsProperty(
          'marketCapChangePercentage24h',
          marketCapChangePercentage24h,
        ),
      )
      ..add(DiagnosticsProperty('circulatingSupply', circulatingSupply))
      ..add(DiagnosticsProperty('totalSupply', totalSupply))
      ..add(DiagnosticsProperty('maxSupply', maxSupply))
      ..add(DiagnosticsProperty('ath', ath))
      ..add(DiagnosticsProperty('athChangePercentage', athChangePercentage))
      ..add(DiagnosticsProperty('athDate', athDate))
      ..add(DiagnosticsProperty('atl', atl))
      ..add(DiagnosticsProperty('atlChangePercentage', atlChangePercentage))
      ..add(DiagnosticsProperty('atlDate', atlDate))
      ..add(DiagnosticsProperty('lastUpdated', lastUpdated))
      ..add(DiagnosticsProperty('roi', roi));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.marketCapRank, marketCapRank) ||
                other.marketCapRank == marketCapRank) &&
            (identical(other.fullyDilutedValuation, fullyDilutedValuation) ||
                other.fullyDilutedValuation == fullyDilutedValuation) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.high24h, high24h) || other.high24h == high24h) &&
            (identical(other.low24h, low24h) || other.low24h == low24h) &&
            (identical(other.priceChange24h, priceChange24h) ||
                other.priceChange24h == priceChange24h) &&
            (identical(
                  other.priceChangePercentage24h,
                  priceChangePercentage24h,
                ) ||
                other.priceChangePercentage24h == priceChangePercentage24h) &&
            (identical(other.marketCapChange24h, marketCapChange24h) ||
                other.marketCapChange24h == marketCapChange24h) &&
            (identical(
                  other.marketCapChangePercentage24h,
                  marketCapChangePercentage24h,
                ) ||
                other.marketCapChangePercentage24h ==
                    marketCapChangePercentage24h) &&
            (identical(other.circulatingSupply, circulatingSupply) ||
                other.circulatingSupply == circulatingSupply) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.ath, ath) || other.ath == ath) &&
            (identical(other.athChangePercentage, athChangePercentage) ||
                other.athChangePercentage == athChangePercentage) &&
            (identical(other.athDate, athDate) || other.athDate == athDate) &&
            (identical(other.atl, atl) || other.atl == atl) &&
            (identical(other.atlChangePercentage, atlChangePercentage) ||
                other.atlChangePercentage == atlChangePercentage) &&
            (identical(other.atlDate, atlDate) || other.atlDate == atlDate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.roi, roi) || other.roi == roi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    symbol,
    name,
    image,
    currentPrice,
    marketCap,
    marketCapRank,
    fullyDilutedValuation,
    totalVolume,
    high24h,
    low24h,
    priceChange24h,
    priceChangePercentage24h,
    marketCapChange24h,
    marketCapChangePercentage24h,
    circulatingSupply,
    totalSupply,
    maxSupply,
    ath,
    athChangePercentage,
    athDate,
    atl,
    atlChangePercentage,
    atlDate,
    lastUpdated,
    roi,
  ]);

  /// Create a copy of CoinModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinModelImplCopyWith<_$CoinModelImpl> get copyWith =>
      __$$CoinModelImplCopyWithImpl<_$CoinModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinModelImplToJson(this);
  }
}

abstract class _CoinModel extends CoinModel {
  const factory _CoinModel({
    required final String id,
    required final String symbol,
    required final String name,
    required final String image,
    @JsonKey(name: 'current_price') required final double currentPrice,
    @JsonKey(name: 'market_cap') required final int marketCap,
    @JsonKey(name: 'market_cap_rank') required final int marketCapRank,
    @JsonKey(name: 'fully_diluted_valuation')
    required final int? fullyDilutedValuation,
    @JsonKey(name: 'total_volume') required final int totalVolume,
    @JsonKey(name: 'high_24h') required final double high24h,
    @JsonKey(name: 'low_24h') required final double low24h,
    @JsonKey(name: 'price_change_24h') required final double priceChange24h,
    @JsonKey(name: 'price_change_percentage_24h')
    required final double priceChangePercentage24h,
    @JsonKey(name: 'market_cap_change_24h')
    required final double marketCapChange24h,
    @JsonKey(name: 'market_cap_change_percentage_24h')
    required final double marketCapChangePercentage24h,
    @JsonKey(name: 'circulating_supply')
    required final double circulatingSupply,
    @JsonKey(name: 'total_supply') required final double? totalSupply,
    @JsonKey(name: 'max_supply') required final double? maxSupply,
    required final double ath,
    @JsonKey(name: 'ath_change_percentage')
    required final double athChangePercentage,
    @JsonKey(name: 'ath_date') required final String athDate,
    required final double atl,
    @JsonKey(name: 'atl_change_percentage')
    required final double atlChangePercentage,
    @JsonKey(name: 'atl_date') required final String atlDate,
    @JsonKey(name: 'last_updated') required final String lastUpdated,
    final RoiModel? roi,
  }) = _$CoinModelImpl;
  const _CoinModel._() : super._();

  factory _CoinModel.fromJson(Map<String, dynamic> json) =
      _$CoinModelImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(name: 'current_price')
  double get currentPrice;
  @override
  @JsonKey(name: 'market_cap')
  int get marketCap;
  @override
  @JsonKey(name: 'market_cap_rank')
  int get marketCapRank;
  @override
  @JsonKey(name: 'fully_diluted_valuation')
  int? get fullyDilutedValuation;
  @override
  @JsonKey(name: 'total_volume')
  int get totalVolume;
  @override
  @JsonKey(name: 'high_24h')
  double get high24h;
  @override
  @JsonKey(name: 'low_24h')
  double get low24h;
  @override
  @JsonKey(name: 'price_change_24h')
  double get priceChange24h;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  double get priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap_change_24h')
  double get marketCapChange24h;
  @override
  @JsonKey(name: 'market_cap_change_percentage_24h')
  double get marketCapChangePercentage24h;
  @override
  @JsonKey(name: 'circulating_supply')
  double get circulatingSupply;
  @override
  @JsonKey(name: 'total_supply')
  double? get totalSupply;
  @override
  @JsonKey(name: 'max_supply')
  double? get maxSupply;
  @override
  double get ath;
  @override
  @JsonKey(name: 'ath_change_percentage')
  double get athChangePercentage;
  @override
  @JsonKey(name: 'ath_date')
  String get athDate;
  @override
  double get atl;
  @override
  @JsonKey(name: 'atl_change_percentage')
  double get atlChangePercentage;
  @override
  @JsonKey(name: 'atl_date')
  String get atlDate;
  @override
  @JsonKey(name: 'last_updated')
  String get lastUpdated;
  @override
  RoiModel? get roi;

  /// Create a copy of CoinModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinModelImplCopyWith<_$CoinModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoiModel _$RoiModelFromJson(Map<String, dynamic> json) {
  return _RoiModel.fromJson(json);
}

/// @nodoc
mixin _$RoiModel {
  double get times => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this RoiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoiModelCopyWith<RoiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoiModelCopyWith<$Res> {
  factory $RoiModelCopyWith(RoiModel value, $Res Function(RoiModel) then) =
      _$RoiModelCopyWithImpl<$Res, RoiModel>;
  @useResult
  $Res call({double times, String currency, double percentage});
}

/// @nodoc
class _$RoiModelCopyWithImpl<$Res, $Val extends RoiModel>
    implements $RoiModelCopyWith<$Res> {
  _$RoiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? times = null,
    Object? currency = null,
    Object? percentage = null,
  }) {
    return _then(
      _value.copyWith(
            times:
                null == times
                    ? _value.times
                    : times // ignore: cast_nullable_to_non_nullable
                        as double,
            currency:
                null == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as String,
            percentage:
                null == percentage
                    ? _value.percentage
                    : percentage // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoiModelImplCopyWith<$Res>
    implements $RoiModelCopyWith<$Res> {
  factory _$$RoiModelImplCopyWith(
    _$RoiModelImpl value,
    $Res Function(_$RoiModelImpl) then,
  ) = __$$RoiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double times, String currency, double percentage});
}

/// @nodoc
class __$$RoiModelImplCopyWithImpl<$Res>
    extends _$RoiModelCopyWithImpl<$Res, _$RoiModelImpl>
    implements _$$RoiModelImplCopyWith<$Res> {
  __$$RoiModelImplCopyWithImpl(
    _$RoiModelImpl _value,
    $Res Function(_$RoiModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? times = null,
    Object? currency = null,
    Object? percentage = null,
  }) {
    return _then(
      _$RoiModelImpl(
        times:
            null == times
                ? _value.times
                : times // ignore: cast_nullable_to_non_nullable
                    as double,
        currency:
            null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as String,
        percentage:
            null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoiModelImpl with DiagnosticableTreeMixin implements _RoiModel {
  const _$RoiModelImpl({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory _$RoiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoiModelImplFromJson(json);

  @override
  final double times;
  @override
  final String currency;
  @override
  final double percentage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoiModel(times: $times, currency: $currency, percentage: $percentage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoiModel'))
      ..add(DiagnosticsProperty('times', times))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('percentage', percentage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoiModelImpl &&
            (identical(other.times, times) || other.times == times) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, times, currency, percentage);

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoiModelImplCopyWith<_$RoiModelImpl> get copyWith =>
      __$$RoiModelImplCopyWithImpl<_$RoiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoiModelImplToJson(this);
  }
}

abstract class _RoiModel implements RoiModel {
  const factory _RoiModel({
    required final double times,
    required final String currency,
    required final double percentage,
  }) = _$RoiModelImpl;

  factory _RoiModel.fromJson(Map<String, dynamic> json) =
      _$RoiModelImpl.fromJson;

  @override
  double get times;
  @override
  String get currency;
  @override
  double get percentage;

  /// Create a copy of RoiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoiModelImplCopyWith<_$RoiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
