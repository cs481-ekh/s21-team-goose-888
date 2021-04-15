import 'package:flutter/material.dart';
import 'package:itd_888/auth.dart';
import 'package:itd_888/FireBaseFireStoreDB.dart';

class AccountInfo extends StatefulWidget {
  @override
  StoreDb db;
  Auth auth;

  AccountInfo({Key, key, @required this.db, @required this.auth})
      : super(key: key);

  _AccountInfo createState() => _AccountInfo();
}

class _AccountInfo extends State<AccountInfo> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String fullName = "";
  int waqtcNumber = 0;
  String userType = "";
  String pd = "";

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
                  "Email: " + email,
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