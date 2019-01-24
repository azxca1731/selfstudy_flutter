import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

mixin ProductModel on Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorite = false;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if(_showFavorite){
      return _products.where((Product item) => item.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  bool get showFavorite {
    return _showFavorite;
  }

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void addProduct(Product addedProduct) {
    _products.add(addedProduct);
    _selectedProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }

  void toggleProductFavoriteState() {
    _products[_selectedProductIndex] = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      isFavorite: !selectedProduct.isFavorite,
    );
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleShowFavorite() {
    _showFavorite = !_showFavorite;
    notifyListeners();
  }
}
