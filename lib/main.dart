import 'package:duckcart_app/providers/celebs_provider.dart';
import 'package:duckcart_app/route/route_generator.dart';
import 'package:duckcart_app/screens/celeb_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CelebProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 3, 48, 115),
        ),
        home: const CelebScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
