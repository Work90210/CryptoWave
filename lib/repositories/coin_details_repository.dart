import 'package:cryptowave/models/coin_details/crypto_chart_data_model/crypto_chart_data_model.dart';
import 'package:cryptowave/network/exception_handler.dart';
import 'package:cryptowave/network/network_response.dart';
import 'package:cryptowave/repositories/base_repository.dart';
import 'package:cryptowave/utils/logger_service.dart';

/// Repository for handling cryptocurrency coin related API calls
class CoinDetailsRepository extends BaseRepository {
  /// Logger for repository operations
  final _logger = LoggerService.instance;

  /// Fetch historical chart data for a specific coin
  ///
  /// Parameters:
  /// - [id]: Coin ID (e.g., 'bitcoin')
  /// - [vsCurrency]: Currency to compare against (default is USD)
  /// - [days]: Data up to number of days ago (default is 7)
  /// - [interval]: Data interval (leave empty for auto granularity, possible value: 'daily')
  /// - [precision]: Decimal place for currency price value
  Future<CryptoChartDataModel?> getCoinHistoricalData({
    required String id,
    String vsCurrency = 'usd',
    String days = '7',
    String? interval,
    String? precision,
  }) async {
    try {
      _logger.d('Fetching coin historical data for: $id');

      final queryParameters = {'vs_currency': vsCurrency, 'days': days};

      if (interval != null) {
        queryParameters['interval'] = interval;
      }

      if (precision != null) {
        queryParameters['precision'] = precision;
      }

      final response = await get<Map<String, dynamic>>(
        url: '/coins/$id/market_chart',
        queryParameters: queryParameters,
        converter: (data) {
          if (data is Map<String, dynamic>) {
            return data;
          }
          throw ApiException(
            message: 'Invalid response format: expected Map but got ${data.runtimeType}',
            errorType: NetworkErrorType.unknown,
          );
        },
      );

      final result = await safeApiCall<Map<String, dynamic>>(
        apiCall: () async => response,
        errorMessage: 'Failed to fetch coin historical data for $id',
      );

      if (result == null) return null;

      return CryptoChartDataModel.fromJson(result);
    } catch (e, stackTrace) {
      _logger.e('Error fetching coin historical data', e, stackTrace);
      throw ExceptionHandler.enhanceException(e, 'Failed to fetch coin historical data for $id');
    }
  }
}
