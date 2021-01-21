import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoritStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://flutter-e26fe-default-rtdb.firebaseio.com/products/${id}.json';
    try {
      await http.patch(url,
          body: jsonEncode({
            'isFavorite': isFavorite,
          }));
      notifyListeners();
    } catch (err) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
