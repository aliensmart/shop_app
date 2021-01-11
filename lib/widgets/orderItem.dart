import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../provider/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expended = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm:ss')
                .format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expended ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expended = !_expended;
                });
              },
            ),
          ),
          if (_expended)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: min(widget.order.products.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${prod.quantity} x \$${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
