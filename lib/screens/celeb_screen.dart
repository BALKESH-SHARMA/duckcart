import 'package:duckcart_app/widget/celebs_grid.dart';
import 'package:flutter/material.dart';

class CelebScreen extends StatelessWidget {
  const CelebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('T I O B U'),
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/image1.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/logs');
                  },
                  child: const Icon(Icons.article)),
            ),
          ],
        ),
        body: Container(
            padding:
                const EdgeInsets.only(top: 15, bottom: 0, left: 25, right: 25),
            child: const CelebsGrid()),
      ),
    );
  }
}
