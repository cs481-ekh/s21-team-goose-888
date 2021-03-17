import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class T166 extends StatefulWidget {
  @override
  _T166 createState() => _T166();
}

class _T166 extends State<T166> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File puckd1,gpuckh2o1,wpuckSSD1,puckd2,gpuckh2o2,wpuckSSD2 ;
  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
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
        title: Text("T166 Gravity Compacted Mix"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(children: [
                //Row 1 BEGINNING
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Serial # ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Organization ",
                      hintText: "Department",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Sample Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value)) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Status ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 1 ENDING

                //Row 2 BEGINNING
                Text(
                  "Weight of Puck Dry 1 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    puckd1 == null
                        ? Text('No image selected.')
                        : Image.file(puckd1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              puckd1  = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Weight of Puck in Water 1 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    gpuckh2o1 == null
                        ? Text('No image selected.')
                        : Image.file(gpuckh2o1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              gpuckh2o1  = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Weight of Puck SSD 1 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    wpuckSSD1 == null
                        ? Text('No image selected.')
                        : Image.file(wpuckSSD1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              wpuckSSD1 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                //Row 2 Ending
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),

                /////////////////////////Row 3 BEGINNING
                Text(
                  "Weight of Puck Dry 2 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    puckd2== null
                        ? Text('No image selected.')
                        : Image.file(puckd2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              puckd2  = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Weight of Puck in Water 2 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    gpuckh2o2 == null
                        ? Text('No image selected.')
                        : Image.file(gpuckh2o2),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              gpuckh2o2  = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Weight of Puck SSD 2 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                   wpuckSSD2== null
                        ? Text('No image selected.')
                        : Image.file(wpuckSSD2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              wpuckSSD2  = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING

                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Remarks",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid remark";
                    return null;
                  },
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING

                //Row 5 Begining
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tested by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Name";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tested by WAQTC",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tested Date *",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))  return "Enter a valid date!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 5 Ending

                //Row 6 Begining
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Retest Flagged by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Name";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Retest Flagged",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Retest Comments ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid comment";
                    return null;
                  },
                ),


                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Ending Row 7
                RaisedButton(
                  onPressed: () {
                    if (_submit()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Save'),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

