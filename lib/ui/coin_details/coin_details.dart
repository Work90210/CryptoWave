import 'package:cryptowave/models/coin/coin_model.dart';
import 'package:cryptowave/models/coin_details/crypto_chart_data_model/crypto_chart_data_model.dart';
import 'package:cryptowave/ui/coin_details/cubit/coin_details_cubit.dart';
import 'package:cryptowave/ui/common/app_bar.dart';
import 'package:cryptowave/ui/common/load_failed.dart';
import 'package:cryptowave/ui/common/loading.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

enum ChartType { price, marketCap, volume }

class CoinDetailsPage extends StatefulWidget {
  const CoinDetailsPage({super.key});
  static const routeName = 'CoinDetailsPage';

  @override
  State<CoinDetailsPage> createState() => _CoinDetailsPageState();
}

class _CoinDetailsPageState extends State<CoinDetailsPage> {
  ChartType _selectedChartType = ChartType.price;

  Widget _buildLoaded(BuildContext context, CryptoChartDataModel chartData, CoinModel coin) {
    return Scaffold(
      appBar: CWAppBar(context, title: coin.name),
      body: RefreshIndicator(
        onRefresh: () async {
          return context.read<CoinDetailsCubit>().pullToRefresh();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(coin),
              _buildChartControls(),
              _buildChart(chartData),
              _buildStats(coin),
              _buildAbout(coin),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(CoinModel coin) {
    final isPositiveChange = coin.priceChangePercentage24h >= 0;
    final changeColor = isPositiveChange ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              coin.image,
              width: 50,
              height: 50,
              errorBuilder:
                  (context, error, stackTrace) => const Icon(Icons.currency_bitcoin, size: 50),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coin.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text(
                  coin.symbol.toUpperCase(),
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                coin.formattedCurrentPrice,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Row(
                children: [
                  Icon(
                    isPositiveChange ? Icons.arrow_upward : Icons.arrow_downward,
                    color: changeColor,
                    size: 16,
                  ),
                  Text(
                    coin.formattedPriceChangePercentage,
                    style: TextStyle(color: changeColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildChartTypeButton(ChartType.price, 'Price'),
          _buildChartTypeButton(ChartType.marketCap, 'Market Cap'),
          _buildChartTypeButton(ChartType.volume, 'Volume'),
        ],
      ),
    );
  }

  Widget _buildChartTypeButton(ChartType type, String label) {
    final isSelected = _selectedChartType == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChartType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Theme.of(context).primaryColor : Colors.grey),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildChart(CryptoChartDataModel chartData) {
    late final List<DataPointModel> dataPoints;
    switch (_selectedChartType) {
      case ChartType.price:
        dataPoints = chartData.prices;
      case ChartType.marketCap:
        dataPoints = chartData.marketCaps;
      case ChartType.volume:
        dataPoints = chartData.totalVolumes;
    }

    if (dataPoints.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: Text('No chart data available')),
      );
    }

    // Format timestamps to readable dates
    // Calculate min timestamp for normalization
    final timestamps = dataPoints.map((p) => p.timestamp).toList();
    final origin = timestamps.reduce((a, b) => a < b ? a : b).toDouble();

    final spots =
        dataPoints.map((point) {
          return FlSpot(point.timestamp.toDouble() - origin, point.value);
        }).toList();

    // Calculate min and max for better chart scaling
    final values = dataPoints.map((p) => p.value).toList();
    final minY = values.reduce((a, b) => a < b ? a : b) * 0.95;
    final maxY = values.reduce((a, b) => a > b ? a : b) * 1.05;

    // Calculate min and max timestamps
    const minX = 0.0; // Start from 0 after normalization
    final maxX = timestamps.reduce((a, b) => a > b ? a : b).toDouble() - origin;

    final gradientColors = [
      Theme.of(context).primaryColor.withAlpha(128),
      Theme.of(context).primaryColor.withAlpha(26),
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 1.70,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.2), strokeWidth: 1);
              },
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    // Add origin back to get the actual timestamp
                    final date = DateTime.fromMillisecondsSinceEpoch((value + origin).toInt());
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        DateFormat('MM/dd').format(date),
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  },
                  interval: ((maxX - minX) / 5).clamp(1, double.infinity),
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    var text = '';
                    if (_selectedChartType == ChartType.price) {
                      text = '\$${value.toStringAsFixed(2)}';
                    } else if (_selectedChartType == ChartType.marketCap ||
                        _selectedChartType == ChartType.volume) {
                      if (value >= 1000000000) {
                        text = '\$${(value / 1000000000).toStringAsFixed(1)}B';
                      } else if (value >= 1000000) {
                        text = '\$${(value / 1000000).toStringAsFixed(1)}M';
                      } else {
                        text = '\$${value.toStringAsFixed(0)}';
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(text, style: const TextStyle(fontSize: 10)),
                    );
                  },
                  reservedSize: 40,
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            borderData: FlBorderData(show: false),
            minX: minX,
            maxX: maxX,
            minY: minY,
            maxY: maxY,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: Theme.of(context).primaryColor,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    // Add origin back to get the actual timestamp
                    final date = DateTime.fromMillisecondsSinceEpoch((spot.x + origin).toInt());
                    var value = '';
                    if (_selectedChartType == ChartType.price) {
                      value = '\$${spot.y.toStringAsFixed(2)}';
                    } else {
                      if (spot.y >= 1000000000) {
                        value = '\$${(spot.y / 1000000000).toStringAsFixed(2)}B';
                      } else if (spot.y >= 1000000) {
                        value = '\$${(spot.y / 1000000).toStringAsFixed(2)}M';
                      } else {
                        value = '\$${spot.y.toStringAsFixed(0)}';
                      }
                    }
                    return LineTooltipItem(
                      DateFormat('MM/dd/yyyy').format(date),
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(text: '\n'),
                        TextSpan(
                          text: value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStats(CoinModel coin) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Statistics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 16),
          _buildStatRow('Market Cap', coin.formattedMarketCap),
          _buildStatRow('Market Cap Rank', '#${coin.marketCapRank}'),
          _buildStatRow('Volume (24h)', '\$${(coin.totalVolume / 1000000).toStringAsFixed(2)}M'),
          _buildStatRow(
            'Circulating Supply',
            '${coin.circulatingSupply.toStringAsFixed(0)} ${coin.symbol.toUpperCase()}',
          ),
          if (coin.totalSupply != null)
            _buildStatRow(
              'Total Supply',
              '${coin.totalSupply!.toStringAsFixed(0)} ${coin.symbol.toUpperCase()}',
            ),
          if (coin.maxSupply != null)
            _buildStatRow(
              'Max Supply',
              '${coin.maxSupply!.toStringAsFixed(0)} ${coin.symbol.toUpperCase()}',
            ),
          _buildStatRow('All-Time High', '\$${coin.ath.toStringAsFixed(2)}'),
          _buildStatRow('All-Time Low', '\$${coin.atl.toStringAsFixed(4)}'),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 16)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildAbout(CoinModel coin) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 16),
          const Text(
            'Market Performance',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildPerformanceRow(
            'Price Change (24h)',
            '${coin.priceChangeSign}\$${coin.priceChange24h.abs().toStringAsFixed(2)}',
            coin.priceChange24h >= 0,
          ),
          _buildPerformanceRow(
            'Market Cap Change (24h)',
            '${coin.priceChangeSign}\$${(coin.marketCapChange24h / 1000000).abs().toStringAsFixed(2)}M',
            coin.marketCapChange24h >= 0,
          ),
          _buildPerformanceRow(
            'Market Cap Change % (24h)',
            '${coin.priceChangeSign}${coin.marketCapChangePercentage24h.abs().toStringAsFixed(2)}%',
            coin.marketCapChangePercentage24h >= 0,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceRow(String label, String value, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 16)),
          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                color: isPositive ? Colors.green : Colors.red,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
      builder: (context, state) {
        return state.map(
          loading:
              (_) => LoadingWidget(onRetry: () => context.read<CoinDetailsCubit>().pullToRefresh()),
          loaded: (state) => _buildLoaded(context, state.coinDetails, state.coinModel),
          error:
              (state) => LoadFailedWidget(
                title: 'Failed to load coin details',
                errorMessage: state.message,
                onRefreshPage: () => context.read<CoinDetailsCubit>().pullToRefresh(),
              ),
        );
      },
    );
  }
}
