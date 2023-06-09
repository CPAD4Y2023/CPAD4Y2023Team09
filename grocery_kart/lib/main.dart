import 'package:flutter/material.dart';
import 'package:grocery_kart/screens/bottomBar.dart';
import 'package:grocery_kart/screens/feeds.dart';
import 'package:grocery_kart/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomBar(),
      routes: {
        FeedsScreen.routeName: (ctx) => const FeedsScreen(),
      },
    );
  }
}
