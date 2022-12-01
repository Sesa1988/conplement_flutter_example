import 'package:example/screens/pokemon/pokemon_overview.dart';
import 'package:example/screens/pokemon_details/pokemon_details.dart';
import 'package:flutter/material.dart';

void start() {
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(primarySwatch: Colors.green);

    return MaterialApp(
      title: 'ExampleApp',
      debugShowCheckedModeBanner: false,
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(secondary: Colors.green),
      ),
      initialRoute: PokemonOverview.routeName,
      routes: {
        PokemonOverview.routeName: (context) => const PokemonOverview(),
        PokemonDetails.routeName: (context) => const PokemonDetails(),
      },
    );
  }
}
