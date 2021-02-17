import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final String text;
  String fullName = "";
  int waqtcNumber = 0;
  String userType = "";
  String pd = "";
  AccountInfo({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ITD-888 Account Information"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
    //padding: EdgeInsets.only(left: 50, right: 50),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Text(
                  "Email: " + text,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Full Name: " + fullName,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Type of User: " + userType,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "pd: " + pd,
                  style: TextStyle(fontSize: 24),
                ),


                ],
          ),
      ),


    );
  }
}