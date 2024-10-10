import 'package:animation_app/ui/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:animation_app/app/app.bottomsheets.dart';
import 'package:animation_app/app/app.dialogs.dart';
import 'package:animation_app/app/app.locator.dart';
import 'package:animation_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeView,
      theme: appTheme,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
