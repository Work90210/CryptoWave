import 'package:bloc/bloc.dart';
import 'package:cryptowave/models/coin/coin_model.dart';
import 'package:cryptowave/network/exception_handler.dart';
import 'package:cryptowave/repositories/coin_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.coinRepository}) : super(const HomePageState.loading()) {
    _init();
  }
  final CoinRepository coinRepository;

  Future<void> _init() async {
    try {
      final coins = await coinRepository.getCoins();

      emit(HomePageState.loaded(coins ?? []));
    } on Exception catch (error) {
      final message = error is ApiException ? error.message : 'An unexpected error occurred';

      emit(HomePageState.error(message));
    }
  }

  void pullToRefresh() {
    emit(const HomePageState.loading());
    _init();
  }
}
