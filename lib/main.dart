import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_page/landing/provider/page_provider.dart';
import 'package:vertical_page/router/router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  AppRoutes.setupRoutes();
  runApp(const APPState());
}

class APPState extends StatelessWidget {
  const APPState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageProvider())],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      title: 'landing',
      // builder: (_, child) {
      //   return const HomePage();
      // },
    );
  }
}
