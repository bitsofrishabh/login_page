import 'package:flutter/material.dart';
import 'package:login_page/src/mixin/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            button(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (s) {
        email = s;
      },
      validator: validateEmail,
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'you@email.com'),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (s) {
        password = s;
      },
      validator: validatePassword,
      decoration: InputDecoration(labelText: 'Password', hintText: 'password'),
    );
  }

  Widget button() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Email and password is $email and $password');
        }
      },
      child: Text('submit'),
    );
  }
}
