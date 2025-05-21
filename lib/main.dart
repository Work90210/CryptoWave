import 'package:cryptowave/routes.dart';
import 'package:cryptowave/ui/home_page/home.dart';
import 'package:cryptowave/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver = RouteObserver<PageRoute<dynamic>>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      onGenerateRoute: Routes.generateRoute,
      navigatorObservers: [routeObserver, NavigationHistoryObserver()],
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}
