import 'package:bloc/bloc.dart';
import 'package:cryptowave/models/coin/coin_model.dart';
import 'package:cryptowave/models/coin_details/crypto_chart_data_model/crypto_chart_data_model.dart';
import 'package:cryptowave/network/exception_handler.dart';
import 'package:cryptowave/repositories/coin_details_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_cubit.freezed.dart';
part 'coin_details_state.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  CoinDetailsCubit({required this.coinDetailsRepository, required this.coinModel})
    : super(const CoinDetailsState.loading()) {
    _init();
  }

  final CoinDetailsRepository coinDetailsRepository;
  final CoinModel coinModel;

  Future<void> _init() async {
    try {
      final coinDetails = await coinDetailsRepository.getCoinHistoricalData(id: coinModel.id);

      if (coinDetails != null) {
        emit(CoinDetailsState.loaded(coinDetails: coinDetails, coinModel: coinModel));
      } else {
        emit(const CoinDetailsState.error(message: 'Failed to load coin details'));
      }
    } on Exception catch (error) {
      final message = error is ApiException ? error.message : 'An unexpected error occurred';

      emit(CoinDetailsState.error(message: message));
    }
  }

  void pullToRefresh() {
    emit(const CoinDetailsState.loading());
    _init();
  }
}
