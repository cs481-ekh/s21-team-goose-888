import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:itd_888/FireBaseFireStoreDB.dart';

class R47 extends StatefulWidget {
  @override
  _R47 createState() => _R47();
}

class _R47 extends State<R47> {
  String dropdownValue = "Select";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File sampTemp, tapeNum;
  StoreDb db;
  TextEditingController labNumberController = TextEditingController();
  TextEditingController initReductionLocationController = TextEditingController();
  TextEditingController performedByController = TextEditingController();
  TextEditingController wAQTCNumberController = TextEditingController();
  TextEditingController dataReducedController = TextEditingController();
  TextEditingController timeReducedController = TextEditingController();
  TextEditingController sampleTempController = TextEditingController();
  TextEditingController witnessController = TextEditingController();
  TextEditingController wWAQTCNumberController = TextEditingController();


  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      _formKey.currentState.save();
      return true;
    }
  }

  void createAddDbMap(){
    Map<String, dynamic> dbMap = {
      "labNumber" :  labNumberController.text,
      "initReductionLocation" : initReductionLocationController.text,
      "performedBy" : performedByController.text,
      "WAQTCNumber" : wAQTCNumberController.text,
      "dataReduced" : dataReducedController.text,
      "timeReduced" : timeReducedController.text,
      "sampleTemp" : sampleTempController.text,
      "witness" : witnessController.text,
      "witnessWAQTCNumber": wWAQTCNumberController.text
    };

    db.setR47(dbMap);

}


  @override
  Widget build(BuildContext context) {
   Scaffold(
      appBar: AppBar(
        title: Text("T30 Sieve Analysis Details"),
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
                      labelText: "Serial # *",
                      labelStyle: TextStyle(color: Colors.red)),
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
                      labelText: "Organization *",
                      hintText: "Department",
                      labelStyle: TextStyle(color: Colors.red)),
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
                      labelText: "Sample Date *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Status *",
                      labelStyle: TextStyle(color: Colors.red)),
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
                //Row 1 ENDING

                //Row 2 Begining
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Qualified Lab Number",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Initial Reduction Location",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Performed by (Electronic Signature) *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "WAQTC Number",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Data Reduced",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Time Reduced",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Ending Row 2

                //Row 3 Begining
                Text(
                  "Sample Temperature",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    sampTemp == null
                        ? Text('No image selected.')
                        : Image.file(sampTemp),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              sampTemp = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Witnessed by (Electronic Signature) *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "WAQTC Number",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sample Location",
                      style: TextStyle(color: Colors.red)),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    items: <String>['Select', 'Acceptance', 'B', 'C', 'D']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    hint: Text(
                      "Requested Tests / Reason for Sample",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  "Box Security Tape Number",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    tapeNum == null
                        ? Text('No image selected.')
                        : Image.file(tapeNum),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              tapeNum = File(imgFile.path);
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
                RaisedButton(
                  onPressed: () {
                    if (_submit()) {
                      //Navigator.pushNamed(context, '/form');
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Save'),
                ),
                //Ending Row 3
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
