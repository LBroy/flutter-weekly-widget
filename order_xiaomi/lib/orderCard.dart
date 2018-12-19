import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  OrderCard({this.orderId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Order ID #$orderId",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(width: 2.0, color: Colors.blue)),
                        child: Text(
                          "Messages (2)",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 2,
                      child: Container(
                        height: 8.0,
                        width: 8.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    )
                  ]),
                  FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 27.0, vertical: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.green],
                          )),
                      child: Text(
                        "Order Details",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
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
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
