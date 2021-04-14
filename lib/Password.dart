import 'package:flutter/material.dart';
import 'package:itd_888/auth.dart';

class PasswordPage extends StatelessWidget {
  Auth auth;
  PasswordPage({Key key, @required this.auth}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var isLoading = false;
  TextEditingController emailController = TextEditingController();
  //String textEmail = "";

  bool _submit() {
    final isValid = formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      formKey.currentState.save();
      return true;
    }
  }

  bool submit() {
    final isValid = formKey2.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      formKey2.currentState.save();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.blue,
      ),
      body: //Padding(
          //padding: const EdgeInsets.all(10.0),
          //padding: EdgeInsets.only(left: 50, right: 50),

          //form
          Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Please type in the email you have connected to your account",
                  style: TextStyle(fontSize: 24),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  controller: emailController,
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
                    //textEmail=value;
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 10.0,
                  ),
                  child: Text(
                    "Send Code",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    auth.resetPassword(emailController.text);
                    //bool check = ;
                    if (_submit()) {
                      showAlertDialog(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
    Padding(
    padding: const EdgeInsets.all(10.0),
       child: Form(
          key: formKey2,
          child: Column(

            children: <Widget>[
              Text(
                " Input the code in your email",
                style: TextStyle(fontSize: 24),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Code'),
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value.isEmpty || value.length != 6) {
                    return 'Enter a valid Code!';
                  }
                  //textEmail=value;
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 10.0,
                ),
                child: Text(
                  "Input Code",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  //bool check = ;
                  if (submit()) {
                    Navigator.pushNamed(context, '/form');
                  }
                },
              ),
            ],
          ),
        ),
    ),
      ]
          ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Code Sent"),
      content: Text("Code was successfully sent"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
