// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NetworkResponseModel<T> {
  /// The HTTP status code
  int get statusCode => throw _privateConstructorUsedError;

  /// Whether the request was successful
  bool get isSuccess => throw _privateConstructorUsedError;

  /// The data returned from the API
  T? get data => throw _privateConstructorUsedError;

  /// Error message if the request failed
  String? get errorMessage => throw _privateConstructorUsedError;

  /// The type of error that occurred
  NetworkErrorType get errorType => throw _privateConstructorUsedError;

  /// The path of the request
  String? get requestPath => throw _privateConstructorUsedError;

  /// The HTTP method used for the request
  String? get requestMethod => throw _privateConstructorUsedError;

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkResponseModelCopyWith<T, NetworkResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkResponseModelCopyWith<T, $Res> {
  factory $NetworkResponseModelCopyWith(
    NetworkResponseModel<T> value,
    $Res Function(NetworkResponseModel<T>) then,
  ) = _$NetworkResponseModelCopyWithImpl<T, $Res, NetworkResponseModel<T>>;
  @useResult
  $Res call({
    int statusCode,
    bool isSuccess,
    T? data,
    String? errorMessage,
    NetworkErrorType errorType,
    String? requestPath,
    String? requestMethod,
  });
}

/// @nodoc
class _$NetworkResponseModelCopyWithImpl<
  T,
  $Res,
  $Val extends NetworkResponseModel<T>
>
    implements $NetworkResponseModelCopyWith<T, $Res> {
  _$NetworkResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? isSuccess = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? errorType = null,
    Object? requestPath = freezed,
    Object? requestMethod = freezed,
  }) {
    return _then(
      _value.copyWith(
            statusCode:
                null == statusCode
                    ? _value.statusCode
                    : statusCode // ignore: cast_nullable_to_non_nullable
                        as int,
            isSuccess:
                null == isSuccess
                    ? _value.isSuccess
                    : isSuccess // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as T?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            errorType:
                null == errorType
                    ? _value.errorType
                    : errorType // ignore: cast_nullable_to_non_nullable
                        as NetworkErrorType,
            requestPath:
                freezed == requestPath
                    ? _value.requestPath
                    : requestPath // ignore: cast_nullable_to_non_nullable
                        as String?,
            requestMethod:
                freezed == requestMethod
                    ? _value.requestMethod
                    : requestMethod // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkResponseModelImplCopyWith<T, $Res>
    implements $NetworkResponseModelCopyWith<T, $Res> {
  factory _$$NetworkResponseModelImplCopyWith(
    _$NetworkResponseModelImpl<T> value,
    $Res Function(_$NetworkResponseModelImpl<T>) then,
  ) = __$$NetworkResponseModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    int statusCode,
    bool isSuccess,
    T? data,
    String? errorMessage,
    NetworkErrorType errorType,
    String? requestPath,
    String? requestMethod,
  });
}

/// @nodoc
class __$$NetworkResponseModelImplCopyWithImpl<T, $Res>
    extends
        _$NetworkResponseModelCopyWithImpl<
          T,
          $Res,
          _$NetworkResponseModelImpl<T>
        >
    implements _$$NetworkResponseModelImplCopyWith<T, $Res> {
  __$$NetworkResponseModelImplCopyWithImpl(
    _$NetworkResponseModelImpl<T> _value,
    $Res Function(_$NetworkResponseModelImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? isSuccess = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
    Object? errorType = null,
    Object? requestPath = freezed,
    Object? requestMethod = freezed,
  }) {
    return _then(
      _$NetworkResponseModelImpl<T>(
        statusCode:
            null == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                    as int,
        isSuccess:
            null == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as T?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        errorType:
            null == errorType
                ? _value.errorType
                : errorType // ignore: cast_nullable_to_non_nullable
                    as NetworkErrorType,
        requestPath:
            freezed == requestPath
                ? _value.requestPath
                : requestPath // ignore: cast_nullable_to_non_nullable
                    as String?,
        requestMethod:
            freezed == requestMethod
                ? _value.requestMethod
                : requestMethod // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$NetworkResponseModelImpl<T> extends _NetworkResponseModel<T> {
  const _$NetworkResponseModelImpl({
    required this.statusCode,
    required this.isSuccess,
    this.data,
    this.errorMessage,
    this.errorType = NetworkErrorType.none,
    this.requestPath,
    this.requestMethod,
  }) : super._();

  /// The HTTP status code
  @override
  final int statusCode;

  /// Whether the request was successful
  @override
  final bool isSuccess;

  /// The data returned from the API
  @override
  final T? data;

  /// Error message if the request failed
  @override
  final String? errorMessage;

  /// The type of error that occurred
  @override
  @JsonKey()
  final NetworkErrorType errorType;

  /// The path of the request
  @override
  final String? requestPath;

  /// The HTTP method used for the request
  @override
  final String? requestMethod;

  @override
  String toString() {
    return 'NetworkResponseModel<$T>(statusCode: $statusCode, isSuccess: $isSuccess, data: $data, errorMessage: $errorMessage, errorType: $errorType, requestPath: $requestPath, requestMethod: $requestMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkResponseModelImpl<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            (identical(other.requestPath, requestPath) ||
                other.requestPath == requestPath) &&
            (identical(other.requestMethod, requestMethod) ||
                other.requestMethod == requestMethod));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    statusCode,
    isSuccess,
    const DeepCollectionEquality().hash(data),
    errorMessage,
    errorType,
    requestPath,
    requestMethod,
  );

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkResponseModelImplCopyWith<T, _$NetworkResponseModelImpl<T>>
  get copyWith => __$$NetworkResponseModelImplCopyWithImpl<
    T,
    _$NetworkResponseModelImpl<T>
  >(this, _$identity);
}

abstract class _NetworkResponseModel<T> extends NetworkResponseModel<T> {
  const factory _NetworkResponseModel({
    required final int statusCode,
    required final bool isSuccess,
    final T? data,
    final String? errorMessage,
    final NetworkErrorType errorType,
    final String? requestPath,
    final String? requestMethod,
  }) = _$NetworkResponseModelImpl<T>;
  const _NetworkResponseModel._() : super._();

  /// The HTTP status code
  @override
  int get statusCode;

  /// Whether the request was successful
  @override
  bool get isSuccess;

  /// The data returned from the API
  @override
  T? get data;

  /// Error message if the request failed
  @override
  String? get errorMessage;

  /// The type of error that occurred
  @override
  NetworkErrorType get errorType;

  /// The path of the request
  @override
  String? get requestPath;

  /// The HTTP method used for the request
  @override
  String? get requestMethod;

  /// Create a copy of NetworkResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkResponseModelImplCopyWith<T, _$NetworkResponseModelImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
