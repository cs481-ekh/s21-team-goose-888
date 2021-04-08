import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'FireBaseFireStoreDB.dart';

class LooseMixR97 extends StatefulWidget {
  @override
  StoreDb db;
  LooseMixR97 ({Key key, @required this.db}) : super(key: key);
  _LooseMixR97 createState() => _LooseMixR97();
}

class _LooseMixR97 extends State<LooseMixR97> {
  var result = "Result In Here";
  bool _isLoading = false;
  dynamic _extractText = "";
  String dropdownValue = "Select";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File sampleTemp, sampleLoc;
 // StoreDb db=StoreDb();
  TextEditingController independentAssessorController = TextEditingController();
  TextEditingController serialNumController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController sampleDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController bidItemController = TextEditingController();
  TextEditingController projectNumberController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController randomNumberController = TextEditingController();
  TextEditingController sampleTemperatureController = TextEditingController();
  TextEditingController quantityRepresentedController = TextEditingController();
  TextEditingController sendReportsToController = TextEditingController();
  TextEditingController sampledByController = TextEditingController();
  TextEditingController WAQTCNumberController = TextEditingController();
  TextEditingController witnessedByController = TextEditingController();
  TextEditingController wWAQTCNumberController = TextEditingController();
  TextEditingController sampleIDNumberController = TextEditingController();

  void dispose() {
    independentAssessorController.dispose();
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    bidItemController.dispose();
    projectNumberController.dispose();
    projectNameController.dispose();
    districtController.dispose();
    randomNumberController.dispose();
    sampleTemperatureController.dispose();
    quantityRepresentedController.dispose();
    sendReportsToController.dispose();
    sampledByController.dispose();
    WAQTCNumberController.dispose();
    witnessedByController.dispose();
    wWAQTCNumberController.dispose();
    sampleIDNumberController.dispose();
    super.dispose();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {
      "independentAssessorController": independentAssessorController.text,
      "serialNumController":  serialNumController.text,
      "organizationController":  organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
      "bidItem": bidItemController.text,
      "projectNumber": projectNumberController.text,
      "projectName": projectNameController.text,
      "district": districtController.text,
      "randomNumber": randomNumberController.text,
      "sampleTemperature": sampleTemperatureController.text,
      "quantityRepresented": quantityRepresentedController.text,
      "sendReportsTo": sendReportsToController.text,
      "sampledBy": sampledByController,
      "WAQTCNumber": WAQTCNumberController.text,
      "witnessedBy": witnessedByController.text,
      "sampleIDNumber": sampleIDNumberController.text,
      "witnessWAQTCNumber": wWAQTCNumberController.text,
    };

    widget.db.setR97(dbMap);
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
        title: Text("Loose Mix (R97) Details"),
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
                  keyboardType: TextInputType.text,

                  onFieldSubmitted: (value) { //sampleDateController.text=now;
                     },
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
                  controller: bidItemController,
                  decoration: InputDecoration(
                      labelText: "Bid Item / Key Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Bid Item / Key Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: projectNumberController,
                  decoration: InputDecoration(
                      labelText: "Project Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Project Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: projectNameController,
                  decoration: InputDecoration(
                      labelText: "Project Name ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Project Name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: districtController,
                  decoration: InputDecoration(
                      labelText: "District ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid District!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: randomNumberController,
                  decoration: InputDecoration(
                      labelText: "Random Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Random Number!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 2 ENDING

                //Row 3 BEGINNING
                Text(
                  "Sample Temperature",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    sampleTemp == null
                        ? Text('No image selected.')
                        : Image.file(sampleTemp),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);

                          if (imgFile != null) {
                            setState(() {
                              _isLoading = true;
                            });
                          } else {
                            print('No image selected.');
                          }

                          sampleTemp = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sampleTemperatureController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sampleTemperatureController,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a Sample Temperature!";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                Center(
                    child: Text(
                  _extractText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  "Sample Location",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    sampleLoc == null
                        ? Text('No image selected.')
                        : Image.file(sampleLoc),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: () async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              sampleLoc = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormField(
                  controller: quantityRepresentedController,
                  decoration: InputDecoration(
                      labelText: "Quantity Represented (Tons)",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Requested Tests / Reasons for Sample",
                      style: TextStyle(color: Colors.black)),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  controller: sendReportsToController,
                  decoration: InputDecoration(
                      labelText: "Send Reports To: ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a Recipient for Reports!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING

                //Row 4 BEGINNING
                TextFormField(
                  controller: sampledByController,
                  decoration: InputDecoration(
                      labelText: "Sampled by (Electronic Signature)",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Electronic Signature!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: WAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "Sample WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: witnessedByController,
                  decoration: InputDecoration(
                      labelText: "Witnessed by (Electronic Signature) ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Electronic Signature for Witness!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wWAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "Witness WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number for Witness!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: sampleIDNumberController,
                  decoration: InputDecoration(
                      labelText: "Sample ID Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Sample ID Number!";
                    return null;
                  },
                ),
                //Row 4 ENDING
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
                RaisedButton(
                  onPressed: () {
                    if (_submit()) {
                      createAddDbMap();
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

  Widget _buildWidgetLoading() {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();
  }
}
