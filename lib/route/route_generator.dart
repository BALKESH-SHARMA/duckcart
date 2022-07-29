import 'package:duckcart_app/screens/celeb_screen.dart';
import 'package:duckcart_app/screens/donation_screen.dart';
import 'package:duckcart_app/screens/logs_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const CelebScreen());
      case '/donationScreen':
        return MaterialPageRoute(
            builder: (context) => DonationScreen(
                  id: args as String,
                ));
      case '/logs':
        return MaterialPageRoute(builder: (context) => const LogsScreen());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('error'),
      ),
      body: const Center(child: Text('page not found')),
    );
  });
}
