import 'package:cryptowave/models/coin/coin_model.dart';
import 'package:cryptowave/network/exception_handler.dart';
import 'package:cryptowave/network/network_response.dart';
import 'package:cryptowave/repositories/base_repository.dart';
import 'package:cryptowave/utils/logger_service.dart';

/// Repository for handling cryptocurrency coin related API calls
class CoinRepository extends BaseRepository {
  /// Logger for repository operations
  final _logger = LoggerService.instance;

  /// Fetch coin market data
  ///
  /// Parameters:
  /// - [vsCurrency]: Currency to compare against (default is USD)
  /// - [order]: Order by which parameter (default is market cap descending)
  /// - [perPage]: Number of results per page (default is 10)
  /// - [page]: Page number (default is 1)
  /// - [sparkline]: Include sparkline data (default is false)
  Future<List<CoinModel>?> getCoins({
    String vsCurrency = 'usd',
    String order = 'market_cap_desc',
    int perPage = 10,
    int page = 1,
    bool sparkline = false,
  }) async {
    try {
      _logger.d('Fetching coins: page=$page, perPage=$perPage');

      final queryParameters = {
        'vs_currency': vsCurrency,
        'order': order,
        'per_page': perPage.toString(),
        'page': page.toString(),
        'sparkline': sparkline.toString(),
      };

      final response = await get<List<dynamic>>(
        url: '/coins/markets',
        queryParameters: queryParameters,
        converter: (data) {
          if (data is List) {
            return data;
          }
          throw ApiException(
            message: 'Invalid response format: expected List but got ${data.runtimeType}',
            errorType: NetworkErrorType.unknown,
          );
        },
      );

      final result = await safeApiCall<List<dynamic>>(
        apiCall: () async => response,
        errorMessage: 'Failed to fetch cryptocurrency market data',
      );

      if (result == null) return null;

      return result.map((item) => CoinModel.fromJson(item as Map<String, dynamic>)).toList();
    } catch (e, stackTrace) {
      _logger.e('Error fetching coins', e, stackTrace);
      throw ExceptionHandler.enhanceException(e, 'Failed to fetch cryptocurrency market data');
    }
  }
}
