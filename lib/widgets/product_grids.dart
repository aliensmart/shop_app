import 'package:flutter/material.dart';
import './product_item.dart';
import '../provider/Product.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ProductsGrids extends StatelessWidget {
  final bool isFavs;
  ProductsGrids(this.isFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
        context); //of context is dinamic so we can specify which data it is
    final products = isFavs ? productsData.favItems : productsData.items;
    // print(isFavs);
    return isFavs
        ? Center(
            child: Text("You don't have favorites"),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (cxt, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: ProductItem(
                  // products[i].id, products[i].title, products[i].imageUrl
                  ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );
  }
}
