import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Order ID #860368",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Column(
          children: <Widget>[
            ProductCard(
              productImageUrl:
                  "https://image2.geekbuying.com/ggo_pic/2018-10-25/Xiaomi-Mi-Mix-3-6-39-Inch-6GB-128GB-Smartphone-Black-757111-.jpg",
              productName: "Xiaomi Mi Mix 3",
              productPrice: 160,
              productColor: "Slate Black",
              productQuantity: 1,
              productStatus: "Packing",
            ),
            ProductCard(
              productImageUrl:
                  "https://cdn.eglobalcentraluk.com/images/detailed/69/xiaomi-mi-8-6gb-128gb-dual-sim-black.jpg",
              productName: "Xiaomi A2 Lite",
              productPrice: 100,
              productColor: "Black",
              productQuantity: 1,
              productStatus: "Processing",
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(),
                RaisedButton(),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName, productColor, productStatus, productImageUrl;
  final int productPrice, productQuantity;
  ProductCard(
      {this.productImageUrl,
      this.productName,
      this.productPrice,
      this.productColor,
      this.productQuantity,
      this.productStatus});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20.0),
      elevation: 8.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Image.network(
                productImageUrl,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "USD $productPrice",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  productColor,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "x $productQuantity",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(productStatus),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
