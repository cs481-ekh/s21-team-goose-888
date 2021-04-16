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
  Map<dynamic, dynamic> dataMap;

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
                FutureBuilder<Map>(
                  future: widget.db.getUserInfo(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData){
                     dataMap = Map.from(snapshot.data);
                     return Column (
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                       Text(
                         "Email: " + dataMap["email"],
                         style: TextStyle(fontSize: 24),
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.width * 0.05,
                       ),
                       Text(
                         "Name: " + dataMap["firstName"] + " " + dataMap["lastName"],
                         style: TextStyle(fontSize: 24),
                       ),
                       SizedBox(
                         height: MediaQuery.of(context).size.width * 0.05,
                       ),
                         Text(
                           "WAQTC number: " + dataMap["waqtcNumber"],
                           style: TextStyle(fontSize: 24),
                         ),
                         SizedBox(
                           height: MediaQuery.of(context).size.width * 0.05,
                         ),
                       ]);
                    }

                    return Center(child: CircularProgressIndicator());
                  }
                )

                ],
          ),
      ),


    );
  }
}