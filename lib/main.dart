import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/application/app_widget.dart';
import 'package:minha_pokedex/src/setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupAll();

  runApp(AppWidget());
}
