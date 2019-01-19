import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final List<Map<String, dynamic>> product;

  AuthPage(this.product);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _idValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'ID'),
              onChanged: (String value) {
                setState(() {
                  _idValue = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
            ),
            SwitchListTile(
              value: _acceptTerms,
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              }, 
              title: Text('Accept Terms')
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Login'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                if(_idValue.length == 0 || _passwordValue.length ==0 ){}
                else {
                  Navigator.pushReplacementNamed(context, '/products');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
