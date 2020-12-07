import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String src;
  final String id;
  final String title;
  ProductItem(this.id, this.title, this.src);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        src,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );
  }
}
