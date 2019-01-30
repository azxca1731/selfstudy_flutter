import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../config.dart' as config;
import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;
  bool _isLoading = false;

  Future<Null> addProduct(
      String title, String description, String image, double price) {
        _isLoading = true;
        notifyListeners();
    final Map<String, dynamic> sendingProduct = {
      'title': title,
      'description': description,
      'image':
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/9/17/1/WU0605H_Chocolate-Devils-Ganache_s4x3.jpg.rend.hgtvcom.826.620.suffix/1383787110354.jpeg',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id,
    };

    
    return http
        .post('${config.firebaseDB}/products.json',
            body: json.encode(sendingProduct))
        .then(
      (http.Response response) {
        _isLoading = false;
        final Map<String, dynamic> responseJson = json.decode(response.body);
        print(responseJson);

        final Product newProduct = Product(
            id: responseJson['name'],
            title: title,
            description: description,
            image: image,
            price: price,
            userEmail: _authenticatedUser.email,
            userId: _authenticatedUser.id);
        _products.add(newProduct);
        notifyListeners();
      },
    );
  }
}

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        id: selectedProduct.id,
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    notifyListeners();
  }

  void fetchProducts() {
    _isLoading = true;
    notifyListeners();
    http
        .get('${config.firebaseDB}/products.json')
        .then((http.Response response) {
      _isLoading = false;
      final List<Product> responseProductList = [];
      final Map<String, dynamic> responseProductMap = json.decode(response.body);
      if (responseProductMap == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      responseProductMap.forEach((String productKey, dynamic productMap) {
        final Product product = Product(
          id: productKey,
          title: productMap['title'],
          description: productMap['description'],
          image: productMap['image'],
          price: productMap['price'],
          userEmail: productMap['userEmail'],
          userId: productMap['userId'],
        );
        responseProductList.add(product);
      });
      _products = responseProductList;
      _isLoading = false;
      notifyListeners();
    });
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        id: selectedProduct.id,
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'fdalsdfasf', email: email, password: password);
  }
}

mixin UtilityModel on ConnectedProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
