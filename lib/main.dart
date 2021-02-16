import 'package:flutter/material.dart';
import 'UserInfo.dart';


void main() {

  //runApp(MyApp());
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
     // '/': (context) => Rout2(),
      '/': (context) => HomePage(),
      '/second': (context) => Rout2(),


    },
  ));
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//      // home: MyHomePage(title: 'Flutter Demo Home Page'),
//       home: HomePage(),
//
//     );
//   }
//}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  //SecondRoute createState() => SecondRoute();
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
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
                onPressed: () => _submit(),
              ),
             Row (
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[

                TextButton(
                child: Align(
                  alignment: Alignment.bottomRight,

                child: Text('Register for Account'),
                ),
                onPressed: () => _submit(),
              ),
              TextButton(
                child: Align(
                  alignment: Alignment.bottomLeft,

                  child: Text('Forgot Password?'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
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
class Rout2 extends StatefulWidget {
  @override
  //_HomePageState createState() => _HomePageState();
  SecondRoute createState() => SecondRoute();
}
class SecondRoute extends State<Rout2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Click Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back!'),
        ),
      ),
    );
  }
}