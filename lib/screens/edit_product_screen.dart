import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/editproduct';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocuseNode = FocusNode();
  final _desFocuseNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _priceFocuseNode.dispose();
    _desFocuseNode
        .dispose(); //dispose will help us clear our focus nod to avoid memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  //focusScope works a bit like media query
                  FocusScope.of(context).requestFocus(
                      _priceFocuseNode); //we are letting flutter know that when the next button is pressed we want the focus to be on the pricefocus node;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocuseNode,
                onFieldSubmitted: (_) {
                  //focusScope works a bit like media query
                  FocusScope.of(context).requestFocus(
                      _desFocuseNode); //we are letting flutter know that when the next button is pressed we want the focus to be on the pricefocus node;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _desFocuseNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
