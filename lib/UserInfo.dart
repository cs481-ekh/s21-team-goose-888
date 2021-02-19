import 'package:flutter/material.dart';

class UserInfo {
  String _username;
  String _password;
  String _email;
  //List of forms the user has (possibly interacted with or is
  //currently working on. Not quite sure yet how we will have it setup.)
  List<int> _forms;

  UserInfo(
      {@required String username,
      @required String password,
      @required String email,
      @required List<int> forms}) {
    this._username = username;
    this._password = password;
    this._email = email;
    this._forms = forms;
  }

  String getUsername() {
    return this._username;
  }

  String getPassword() {
    return this._password;
  }

  String getEmail() {
    return this._email;
  }

  List<int> getForms() {
    return this._forms;
  }
}
