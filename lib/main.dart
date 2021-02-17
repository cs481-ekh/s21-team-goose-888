
import 'package:flutter/material.dart';
import 'Registration.dart';
import 'AccountInfo.dart';

String textEmail = "";
void main() {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',

    routes: {
      '/': (context) => HomeLogin(),
      '/register': (context)  => Registration(),
      '/third': (context) => ThirdRoute(),
      '/account': (context) => AccountInfo(text: textEmail,),

    },
  ));
}

class HomeLogin extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  //String textEmail = "";

  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    }else{
      _formKey.currentState.save();
      return true;
    }



  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("ITD-888 Login"),
        //leading: Icon(Icons.filter_vintage),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        //padding: EdgeInsets.only(left: 50, right: 50),

        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              //styling

              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
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
                  textEmail=value;
                  return null;
                },
              ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(

                decoration: InputDecoration(labelText: 'Password'),
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
              RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 10.0,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  //bool check = ;
                  if(_submit()){


                    Navigator.pushNamed(context, '/account');
                  }

                },
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  TextButton(
                    child: Align(
                      alignment: Alignment.bottomRight,

                      child: Text('Register for Account'),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                  TextButton(
                    child: Align(
                      alignment: Alignment.bottomLeft,

                      child: Text('Forgot Password?'),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }

}


class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
