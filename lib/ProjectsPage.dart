import 'package:flutter/material.dart';
import 'FireBaseFireStoreDB.dart';
import 'package:flutter/rendering.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPage createState() => _ProjectsPage();
}
class _ProjectsPage extends State<ProjectsPage> {
  var formKey = GlobalKey<FormState>();

  var isLoading = false;
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
  int _value = 1;
  StoreDb db;
  //final <List<String>> list_items =db.listProjects();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects Available"),
        backgroundColor: Colors.blue,
      ),
      body: //Padding(
      //padding: const EdgeInsets.all(10.0),
      //padding: EdgeInsets.only(left: 50, right: 50),

      //form

      Column(children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Form(
        //     key: formKey,
        //     child: Column(
        //       children: <Widget>[
        //         DropdownButton(
        //           value: _value,
        //           selectedItemBuilder: (BuildContext context)
        //           {
        //             return list_items.map<Widget>((int item) {
        //               return Text('item $item');
        //             }).toList();
        //           },
        //           items: list_items.map((int item) {
        //             return DropdownMenuItem<int>(
        //               child: Text('Log $item'),
        //               value: item,
        //             );
        //           }).toList(),
        //           onChanged: (value) {
        //             setState(() {
        //               _value = value;
        //             });
        //           },
        //         ),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.width * 0.05,
        //         ),
        //         RaisedButton(
        //           padding: EdgeInsets.symmetric(
        //             vertical: 1.0,
        //             horizontal: 10.0,
        //           ),
        //           child: Text(
        //             "Go to Project",
        //             style: TextStyle(
        //               fontSize: 16.0,
        //             ),
        //           ),
        //           onPressed: () {
        //             //bool check = ;
        //             if (_submit()) {
        //               showAlertDialog(context);
        //             }
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

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
