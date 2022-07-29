import 'package:currency_picker/currency_picker.dart';
import 'package:duckcart_app/model/celeb_model.dart';
import 'package:flutter/material.dart';

class CelebProvider with ChangeNotifier {
  final List<Celebs> _celebList = [
    Celebs(
        id: '1',
        name: 'CarryMinati',
        title: 'Youtuber',
        imageUrl:
            'https://femina.wwmindia.com/thumb/content/2019/jul/thajeynagar1562839357.jpg?width=1200&height=900'),
    Celebs(
        id: '2',
        name: 'Bhuvan Bam',
        title: 'Youtuber',
        imageUrl: 'https://wallpapercave.com/wp/wp4248287.jpg'),
    Celebs(
        id: '3',
        name: 'Ryan Reynolds',
        title: 'Actor',
        imageUrl:
            'https://media.vanityfair.com/photos/5f3aa2dcea4a2b0e8b8645ad/master/pass/reynolds.jpg'),
    Celebs(
        id: '4',
        name: 'Bobby Deol',
        title: 'Actor',
        imageUrl:
            'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202207/BOBBY_DEOL.png?SwUNTVEFL9iNgcv57b4ZWdfOP_sJ89ZY&size=770:433'),
    Celebs(
        id: '5',
        name: 'CarryMinati',
        title: 'Youtuber',
        imageUrl:
            'https://femina.wwmindia.com/thumb/content/2019/jul/thajeynagar1562839357.jpg?width=1200&height=900'),
    Celebs(
        id: '6',
        name: 'Bhuvan Bam',
        title: 'Youtuber',
        imageUrl: 'https://wallpapercave.com/wp/wp4248287.jpg'),
    Celebs(
        id: '7',
        name: 'Ryan Reynolds',
        title: 'Actor',
        imageUrl:
            'https://media.vanityfair.com/photos/5f3aa2dcea4a2b0e8b8645ad/master/pass/reynolds.jpg'),
    Celebs(
        id: '8',
        name: 'Bobby Deol',
        title: 'Actor',
        imageUrl:
            'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202207/BOBBY_DEOL.png?SwUNTVEFL9iNgcv57b4ZWdfOP_sJ89ZY&size=770:433'),
  ];
  List<Celebs> get celebList {
    return [..._celebList];
  }

  Celebs findByID(String id) {
    return _celebList.firstWhere((cleb) => cleb.id == id);
  }

  // logs

  final List<Celebs> _logs = [];
  List<Celebs> get logList {
    return [..._logs];
  }

  void addLogs(
      String id, String amount, String name, String message, Currency curr) {
    Celebs item = findByID(id);
    _logs.add(
      Celebs(
        id: item.id,
        name: item.name,
        title: item.title,
        imageUrl: item.imageUrl,
        amount: amount,
        message: message,
        senderName: name,
        curr: curr,
      ),
    );
  }

  @override
  notifyListeners();
}
