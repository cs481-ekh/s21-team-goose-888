import 'package:flutter/material.dart';
import 'Registration.dart';
import 'AccountInfo.dart';
import 'FormSections.dart';
import 'Password.dart';
import 'LooseMixR97.dart';
import 'Custody.dart';
import 'R47.dart';
import 'T329.dart';
import 'T308.dart';
import 'T209.dart';
import 'T166.dart';
import 'T30.dart';
import 'T312.dart';
import 'auth.dart';
import 'ProjectsPage.dart';
import 'FireBaseFireStoreDB.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

String textEmail = "";
Auth auth = Auth();
StoreDb dbe = StoreDb();
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeLogin(),
      '/register': (context) => Registration(),
      '/password': (context) => PasswordPage(
            auth: auth,
      ),
      '/account': (context) => AccountInfo(
            text: textEmail,
          ),
      '/form': (context) => FormSections(
            db: dbe,
            auth: auth,
          ),
      '/project': (context) => ProjectsPage(
            db: dbe,
            auth: auth,
          ),
      '/LooseMixR97': (context) => LooseMixR97(
            db: dbe,
          ),
      '/Custody': (context) => Custody(
            db: dbe,
          ),
      '/R47': (context) => R47(
            db: dbe,
          ),
      '/T166': (context) => T166(
            db: dbe,
          ),
      '/T30': (context) => T30(
            db: dbe,
          ),
      '/T329': (context) => T329(
            db: dbe,
          ),
      '/T308': (context) => T308(
            db: dbe,
          ),
      '/T209': (context) => T209(
            db: dbe,
          ),
      '/T312': (context) => T312(
            db: dbe,
          ),
    },
  ));
}

class HomeLogin extends StatefulWidget {
  HomeLogin({Key key, this.title, this.auth, this.onSignIn}) : super(key: key);
  final String title;
  final BaseAuth auth;
  final VoidCallback onSignIn;
  @override
  _HomeLogin createState() => _HomeLogin();
}

class _HomeLogin extends State<HomeLogin> {
  static final _formKey = GlobalKey<FormState>();

  var isLoading = false;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      _formKey.currentState.save();
      return true;
    }
  }

  Future<UserCredential> firebaseAuthLogin(
      String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("login successful");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user with any such email');
      } else {
        print('Incorrect credentials entered');
      }
    }
    return userCredential;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return appBuild(context); //TODO: Create a error page
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return appBuild(context);
          }
          return appBuild(context); //TODO: create loading page
        });
  }

  Widget appBuild(BuildContext context) {
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
                controller: emailController,
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
                  textEmail = value;
                  return null;
                },
              ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(
                controller: passwordController,
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
                onPressed: () async {
                  //bool check = ;
                  if (_submit()) {
                    String uid;
                    await auth.signIn( emailController.text, passwordController.
                      text)
                        .then((value) => uid = value);
                    if(uid != 'login failed') {
                      Navigator.pushNamed(context, '/project');
                    }else {
                      showAlertDialog(context);
                    }
                  }
                },
              ),
              Row(
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
                      Navigator.pushNamed(context, '/password');
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
    title: Text(""
        "Incorrect Credentials"),
    content: Text("Please try again or click on register."),
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