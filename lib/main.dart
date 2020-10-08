import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_provider/core/constants/app_constants.dart';
import 'package:rick_and_morty_provider/provider_conf.dart';
import 'package:rick_and_morty_provider/ui/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RoutePath.home,
        onGenerateRoute: Routing.generateRoute,
      ),
    );
  }
}
