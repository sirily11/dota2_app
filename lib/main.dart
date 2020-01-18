import 'package:dota2/models/dota_model.dart';
import 'package:dota2/pages/firstpage/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DotaModel(),
        )
      ],
      child: MaterialApp(
        title: 'Dota Data',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: FirstPage(),
      ),
    );
  }
}
