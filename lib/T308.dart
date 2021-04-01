import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'FireBaseFireStoreDB.dart';

class T308 extends StatefulWidget {
  @override
  _T308 createState() => _T308();
}

class _T308 extends State<T308> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File Initial, Assembly, Final;

  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      _formKey.currentState.save();
      return true;
    }
  }
  StoreDb db;
  TextEditingController independentAssessorController = TextEditingController();
  TextEditingController serialNumController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController sampleDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController testedByController = TextEditingController();
  TextEditingController testedByWAQTCController = TextEditingController();
  //zTextEditingController testedDateController = TextEditingController();
  TextEditingController retestFlaggedbyController = TextEditingController();
  TextEditingController retestFlaggedController = TextEditingController();
  TextEditingController retestCommentsController = TextEditingController();

  void dispose() {
    independentAssessorController.dispose();
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    remarksController.dispose();
    testedByController.dispose();
    testedByWAQTCController.dispose();
    retestFlaggedbyController.dispose();
    retestFlaggedController.dispose();
    retestCommentsController.dispose();

    super.dispose();
  }

  void createAddDbMap(){
    Map<String, dynamic> dbMap = {
      "independentAssessorController": independentAssessorController.text,
      "serialNumController":  serialNumController.text,
      "organizationController":  organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
      "remarks": remarksController.text,
      "testedBy": testedByController.text,
      "testedByWAQTC" : testedByWAQTCController.text,
      "retestFlaggedBy": retestFlaggedbyController.text,
      "retestFlagged": retestFlaggedController.text,
      "retestComments": retestCommentsController.text,

    };

    db.setT312(dbMap);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("T308 Asphalt Content by Ignition Method"),
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
                  controller: serialNumController,
                  decoration: InputDecoration(
                      labelText: "Serial # ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: organizationController,
                  decoration: InputDecoration(
                      labelText: "Organization",
                      hintText: "Department",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid  Organization name!";
                    return null;
                  },
                ),
                TextFormField(
                  //controller: sampleDateController,
                  decoration: InputDecoration(
                      labelText: "Sample Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value)) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: statusController,
                  decoration: InputDecoration(
                      labelText: "Status",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Status!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 1 ENDING

                //Row 2 BEGINNING
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Furnace ID ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid Number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Date on Ticket",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("[a-zA-Z]").hasMatch(value))
                      return "Enter a valid  Organization name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Ticket AC % ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Time on Ticket ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("[a-zA-Z]").hasMatch(value))
                      return "Enter a valid Status!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 2 ENDING

                //Row 3 BEGINNING
                Text(
                  "Basket & Initial Sample",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    Initial == null
                        ? Text('No image selected.')
                        : Image.file(Initial),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              Initial = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                Text(
                  "Basket Assembly",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    Assembly == null
                        ? Text('No image selected.')
                        : Image.file(Assembly),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              Assembly = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Calculated Initial Sample ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Basket & Final Aggregate",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    Final == null
                        ? Text('No image selected.')
                        : Image.file(Final),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              Final = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Ending Row 3

                //Row 4 BEGINNING
                TextFormField(
                  controller: testedByController,
                  decoration: InputDecoration(
                      labelText: "T308 Tested by ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  controller:  testedByWAQTCController,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(

                  decoration: InputDecoration(
                      labelText: "Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: independentAssessorController,
                  decoration: InputDecoration(
                      labelText: "Independent Assessor Comments",
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
                //Row 4 ENDING

                RaisedButton(
                  onPressed: () {
                    if (_submit()) {
                      //Navigator.pushNamed(context, '/form');
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
