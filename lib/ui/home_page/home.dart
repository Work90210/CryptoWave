import 'package:cryptowave/models/coin/coin_model.dart';
import 'package:cryptowave/ui/coin_details/coin_details.dart';
import 'package:cryptowave/ui/common/app_bar.dart';
import 'package:cryptowave/ui/common/load_failed.dart';
import 'package:cryptowave/ui/common/loading.dart';
import 'package:cryptowave/ui/home_page/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = 'HomePage';

  Widget _buildCard(BuildContext context, CoinModel coin) {
    final isPositiveChange = coin.priceChangePercentage24h >= 0;
    final changeColor = isPositiveChange ? Colors.green : Colors.red;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Rank
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                '${coin.marketCapRank}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                coin.image,
                width: 40,
                height: 40,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(Icons.currency_bitcoin, size: 40),
              ),
            ),
            const SizedBox(width: 16),
            // Name and Symbol
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    coin.symbol.toUpperCase(),
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            // Price and Change
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  coin.formattedCurrentPrice,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      isPositiveChange ? Icons.arrow_upward : Icons.arrow_downward,
                      color: changeColor,
                      size: 14,
                    ),
                    Text(
                      coin.formattedPriceChangePercentage,
                      style: TextStyle(color: changeColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaded(BuildContext context, List<CoinModel> coins) {
    return Scaffold(
      appBar: CWAppBar(context),
      body: ColoredBox(
        color: const Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Top 10 Cryptocurrencies',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return context.read<HomePageCubit>().pullToRefresh();
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      final coin = coins[index];

                      return GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              CoinDetailsPage.routeName,
                              arguments: coin,
                            ),
                        child: _buildCard(context, coin),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return state.map(
          loading:
              (_) => LoadingWidget(onRetry: () => context.read<HomePageCubit>().pullToRefresh()),
          loaded: (state) => _buildLoaded(context, state.coins),
          error: (value) {
            return LoadFailedWidget(
              title: 'Failed to load cryptocurrencies',
              errorMessage: value.message,
              onRefreshPage: () => context.read<HomePageCubit>().pullToRefresh(),
            );
          },
        );
      },
    );
  }
}
