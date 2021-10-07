import 'package:flutter/material.dart';

class FavAttr with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  FavAttr({required this.id, required this.title, required this.price, required this.imageUrl});
}
