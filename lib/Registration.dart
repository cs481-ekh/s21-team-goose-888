import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itd_888/FireBaseFireStoreDB.dart';


class Registration extends StatefulWidget {
  @override
  StoreDb db;
  Registration({Key key, @required this.db}) : super(key: key);
  _Registration createState() => _Registration();
}

class _Registration extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _waqtcController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _waqtcController.dispose();
    super.dispose();
  }

  bool _submit() {
    final _isValid = _formKey.currentState.validate();
    if (!_isValid) {
      return false;
    } else {
      _formKey.currentState.save();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: Column(children: [
                    Align(
                      child: Text(
                        "Required Fields *",
                        style: TextStyle(color: Colors.red),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          labelText: "First Name *",
                          labelStyle: TextStyle(color: Colors.red)),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {},
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp("/^[a-z ,.'-]+\$/i").hasMatch(value))
                          return "Enter a valid first name!";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          labelText: "Last Name *",
                          labelStyle: TextStyle(color: Colors.red)),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {},
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp("/^[a-z ,.'-]+\$/i").hasMatch(value))
                          return "Enter a valid last name!";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: "E-mail *",
                          labelStyle: TextStyle(color: Colors.red)),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "User Type"),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {},
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp("/^[a-z ,.'-]+\$/i").hasMatch(value))
                          return "Enter a valid user type!";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _waqtcController,
                      decoration: InputDecoration(labelText: "WAQTC Number"),
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (value) {},
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp("/^[a-z ,.'-]+\$/i").hasMatch(value))
                          return "Enter a valid WAQTC number!";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password *',
                          labelStyle: TextStyle(color: Colors.red)),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {},
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Confirm Password *',
                          labelStyle: TextStyle(color: Colors.red)),
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {},
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () async {
                          _register(
                              _emailController.text, _passwordController.text);
                          widget.db.addNewUser(_firstNameController.text, _lastNameController.text,
                          _emailController.text, _waqtcController.text);
                          Navigator.pop(context);
                        },
                        child: Text('Register'),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'),
                        color: Colors.red,
                      ),
                    ),
                  ]),
                ))));
  }

  void _register(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
