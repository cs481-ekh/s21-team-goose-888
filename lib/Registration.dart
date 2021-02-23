import 'package:flutter/material.dart';

String _textEmail = "";

class _RegInfo {
  String firstName;
  String lastName;
  String email;
  int userType;
  int waqtcNum;
  String password;

  _RegInfo(this.firstName, this.lastName, this.email, this.userType,
      this.waqtcNum, this.password);
}

class Registration extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

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
                        _textEmail = value;
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
                        onPressed: () {
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
}
