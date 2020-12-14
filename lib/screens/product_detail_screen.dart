import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final producId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context, listen: false).findById(
        producId); //listen is false to tell the app to not listen to changes in the product page

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
