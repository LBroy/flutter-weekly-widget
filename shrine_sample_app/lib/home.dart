import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/product.dart';
import 'models/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products
        .map((product) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset(
                        product.assetName,
                        fit: BoxFit.fitWidth,
                        package: product.assetPackage,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: theme.textTheme.title,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          formatter.format(product.price),
                          style: theme.textTheme.body2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        title: Text("SHRINE"),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: "menu",
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              semanticLabel: "search",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              semanticLabel: "filter",
            ),
          )
        ],
      ),
      // TODO: Add a grid view (102)
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
    );
  }
}
