import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/routes/router.dart';
import 'package:minha_pokedex/src/application/routes/routes_names.dart';
import 'package:minha_pokedex/src/utils/strings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: Strings.pokedex,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 175, 94, 94),
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesNames.homePage,
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}
