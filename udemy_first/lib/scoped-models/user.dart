import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

mixin UserModel on Model {
  User _authenicatedUser;

  void login(String email, String password) {
    _authenicatedUser = User(
      email: email,
      password: password,
      id: 'Junghun Lee',
    );
  }
}
