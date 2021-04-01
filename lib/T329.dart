import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:tesseract_ocr/tesseract_ocr.dart';

import 'FireBaseFireStoreDB.dart';

class T329 extends StatefulWidget {
  @override
  _T329 createState() => _T329();
}

class _T329 extends State<T329> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File panMass,
      initialSampTemp,
      initialSampTemp90,
      panInitialSamp,
      panInitialSamp30,
      drySample,
      drySample30,
      panDrySamp,
      panDrySamp30;
  StoreDb db;
  TextEditingController serialNumController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController sampleDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController ovenTempController = TextEditingController();
  TextEditingController testedByController = TextEditingController();
  TextEditingController WAQTCNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void dispose() {
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    ovenTempController.dispose();
    testedByController.dispose();
    WAQTCNumberController.dispose();
    dateController.dispose();
    super.dispose();
  }
  void createAddDbMap(){
    Map<String, dynamic> dbMap = {
      "serialNumController":  serialNumController.text,
      "organizationController":  organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
      "ovenTemp": ovenTempController.text,
      "testedBy": testedByController.text,
      "WAQTCNumber":WAQTCNumberController.text,
      "date":dateController.text,
    };

    db.setT329(dbMap);

  }
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
        title: Text("T329 Moisture Content of Bituminous Mixes"),
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
                  controller: ovenTempController,
                  decoration: InputDecoration(
                      labelText: "Oven Temp ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                Text(
                  "Pan Mass",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    panMass == null
                        ? Text('No image selected.')
                        : Image.file(panMass),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              panMass = File(imgFile.path);
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
                //Row 2 Ending

                //Row 3 BEGINNING
                Text(
                  "Initial Sample Temp",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    initialSampTemp == null
                        ? Text('No image selected.')
                        : Image.file(initialSampTemp),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              initialSampTemp = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                Text(
                  "90 Minute",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    initialSampTemp90 == null
                        ? Text('No image selected.')
                        : Image.file(initialSampTemp90),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              initialSampTemp90 = File(imgFile.path);
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
                Text(
                  "Pan & Initial Sample",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    panInitialSamp == null
                        ? Text('No image selected.')
                        : Image.file(panInitialSamp),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              panInitialSamp = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                Text(
                  "30 minute",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    panInitialSamp30 == null
                        ? Text('No image selected.')
                        : Image.file(panInitialSamp30),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              panInitialSamp30 = File(imgFile.path);
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

                Text(
                  "Dry Sample Temp",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    drySample == null
                        ? Text('No image selected.')
                        : Image.file(drySample),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              drySample = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                Text(
                  "30 minute",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    drySample30 == null
                        ? Text('No image selected.')
                        : Image.file(drySample30),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              drySample30 = File(imgFile.path);
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

                Text(
                  "Pan & Dry Sample",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    panDrySamp == null
                        ? Text('No image selected.')
                        : Image.file(panDrySamp),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              panDrySamp = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                Text(
                  "30 minute",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    panDrySamp30 == null
                        ? Text('No image selected.')
                        : Image.file(panDrySamp30),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              panDrySamp30 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                //Row 3 ENDING

                //Row 4 BEGINNING
                TextFormField(
                  controller: testedByController,
                  decoration: InputDecoration(
                      labelText: "T308 Tested by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: WAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  //controller: dateController,
                  decoration: InputDecoration(
                      labelText: "Date *",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid date!";
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
