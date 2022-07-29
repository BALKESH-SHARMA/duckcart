import 'package:currency_picker/currency_picker.dart';

class Celebs {
  String id;
  String name;
  String title;
  String? amount;
  String imageUrl;
  String? senderName;
  String? message;
  Currency? curr;
  Celebs({
    required this.id,
    required this.name,
    required this.title,
    required this.imageUrl,
    this.amount,
    this.message,
    this.senderName,
    this.curr,
  });
}
