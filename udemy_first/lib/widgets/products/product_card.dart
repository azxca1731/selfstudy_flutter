import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import './address_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/product.dart';
import '../../scoped-models/products.dart';

class ProductCard extends StatelessWidget {
  final Product _product;
  final int _productIndex;

  ProductCard(this._product, this._productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(_product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(_product.price),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.pushNamed<bool>(
              context,
              '/product/' + _productIndex.toString(),
            );
          },
        ),
        ScopedModelDescendant<ProductModel>(
          builder: (BuildContext context, Widget child, ProductModel model) {
            return IconButton(
              icon: Icon(model.products[_productIndex].isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                model.selectProduct(_productIndex);
                model.toggleProductFavoriteState();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(_product.image),
          _buildTitlePriceRow(),
          AddressTag('Myunji Univ, YongIn'),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
