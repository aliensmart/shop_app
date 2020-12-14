import 'package:flutter/material.dart';
import '../provider/Product.dart';
import '../widgets/product_grids.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import './cart_screen.dart';

enum FilterOption { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  // final List<Product> loadedProducts =

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFaavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raaga'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              print(selectedValue);
              if (selectedValue == FilterOption.Favorites) {
                //..
                setState(() {
                  _showFaavoriteOnly = true;
                });
              } else {
                //...
                setState(() {
                  _showFaavoriteOnly = false;
                });
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("only Favorites"),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) =>
                Badge(child: ch, value: cartData.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductsGrids(_showFaavoriteOnly),
    );
  }
}
