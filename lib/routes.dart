import 'package:cryptowave/models/coin/coin_model.dart';
import 'package:cryptowave/repositories/coin_details_repository.dart';
import 'package:cryptowave/repositories/coin_repository.dart';
import 'package:cryptowave/ui/coin_details/coin_details.dart';
import 'package:cryptowave/ui/coin_details/cubit/coin_details_cubit.dart';
import 'package:cryptowave/ui/home_page/cubit/home_page_cubit.dart';
import 'package:cryptowave/ui/home_page/home.dart';
import 'package:cryptowave/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    MaterialPageRoute route(Widget widget) {
      return MaterialPageRoute(builder: (context) => widget, settings: settings);
    }

    if (name == HomePage.routeName) {
      return route(
        BlocProvider<HomePageCubit>(
          create: (context) => HomePageCubit(coinRepository: getIt<CoinRepository>()),
          child: const HomePage(),
        ),
      );
    }

    if (name == CoinDetailsPage.routeName) {
      if (args is! CoinModel) {
        return route(
          _errorRoute(
            RouteSettings(
              name: settings.name,
              arguments: 'Expected CoinModel but got ${args.runtimeType}',
            ),
          ),
        );
      }
      final coinModel = args;
      return route(
        BlocProvider<CoinDetailsCubit>(
          create:
              (context) => CoinDetailsCubit(
                coinDetailsRepository: getIt<CoinDetailsRepository>(),
                coinModel: coinModel,
              ),
          child: const CoinDetailsPage(),
        ),
      );
    }
    return route(_errorRoute(settings));
  }

  static Widget _errorRoute(RouteSettings settings) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("Route doesn't exist"),
            Text('Route: ${settings.name}'),
            Text('Arguments: ${settings.arguments}'),
          ],
        ),
      ),
    );
  }
}
