import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageURL;
  final String description;
  final double price;
  final String address ;

  ProductPage(this.title, this.imageURL, this.description, this.price, this.address);

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          address,
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text('\$' + price.toString(),
            style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
      ],
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageURL),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TitleDefault(title),
            ),
           _buildAddressPriceRow(),
            Container(
                margin: EdgeInsets.only(top: 5.0),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
