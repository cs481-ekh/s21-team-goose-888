import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:itd_888/FireBaseFireStoreDB.dart';

class R47 extends StatefulWidget {
  @override
  StoreDb db;
  R47({Key key, @required this.db}) : super(key: key);
  _R47 createState() => _R47();
}

class _R47 extends State<R47> {
  var result = "Result In Here";
  var _check = "";
  bool _isLoading = false;
  dynamic _extractText = "";
  String dropdownValue = "Select";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File sampTemp, tapeNum;

  TextEditingController serialNumController;
  TextEditingController organizationController;
  TextEditingController sampleDateController;
  TextEditingController statusController;

  TextEditingController labNumberController;
  TextEditingController initReductionLocationController;
  TextEditingController performedByController;
  TextEditingController wAQTCNumberController;
  TextEditingController dateReducedController;
  TextEditingController timeReducedController;
  TextEditingController sampleTempController;
  TextEditingController witnessController;
  TextEditingController wWAQTCNumberController;
  TextEditingController boxSecurityTapeController;

  TextEditingController independentAssessorController;

  void initState() {
    var _map = widget.db.getR47();
    _check = _map["reasonForSample"];

    serialNumController =
        TextEditingController(text: _map["serialNumController"]);
    organizationController =
        TextEditingController(text: _map["organizationController"]);
    if (_map["sampleDateController"] == "" ||
        !_map.containsKey(sampleDateController)) {
      sampleDateController = TextEditingController(text: now);
    } else {
      sampleDateController =
          TextEditingController(text: _map["sampleDateController"]);
    }

    statusController = TextEditingController(text: _map["statusController"]);

    labNumberController = TextEditingController(text: _map["labNumber"]);
    initReductionLocationController =
        TextEditingController(text: _map["initReductionLocation"]);
    performedByController = TextEditingController(text: _map["performedBy"]);
    wAQTCNumberController = TextEditingController(text: _map["WAQTCNumber"]);

    if (_map["dateReducedController"] == "" ||
        !_map.containsKey(dateReducedController)) {
      dateReducedController = TextEditingController(text: now);
    } else {
      dateReducedController =
          TextEditingController(text: _map["dateReducedController"]);
    }

    if (_map["timeReducedController"] == "" ||
        !_map.containsKey(timeReducedController)) {
      timeReducedController = TextEditingController(text: now);
    } else {
      timeReducedController =
          TextEditingController(text: _map["timeReducedController"]);
    }

    sampleTempController = TextEditingController(text: _map["sampleTemp"]);
    witnessController = TextEditingController(text: _map["witness"]);
    wWAQTCNumberController =
        TextEditingController(text: _map["witnessWAQTCNumber"]);
    boxSecurityTapeController =
        TextEditingController(text: _map["boxSecurityTape"]);
    independentAssessorController =
        TextEditingController(text: _map["independentAssessorController"]);

    if (_check == "0" || _check == "") {
      dropdownValue = "Select";
    } else if (_check == "1") {
      dropdownValue = "Acceptance";
    } else if (_check == "2") {
      dropdownValue = "B";
    } else if (_check == "3") {
      dropdownValue = "C";
    } else if (_check == "4") {
      dropdownValue = "D";
    } else {
      dropdownValue = "Select";
    }
    super.initState();
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
  void dispose() {
    independentAssessorController.dispose();
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    labNumberController.dispose();
    initReductionLocationController.dispose();
    performedByController.dispose();
    wAQTCNumberController.dispose();
    dateReducedController.dispose();
    timeReducedController.dispose();
    sampleTempController.dispose();
    witnessController.dispose();
    wWAQTCNumberController.dispose();
    boxSecurityTapeController.dispose();
    super.dispose();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {
      "labNumber": labNumberController.text,
      "initReductionLocation": initReductionLocationController.text,
      "performedBy": performedByController.text,
      "WAQTCNumber": wAQTCNumberController.text,
      "dateReduced": dateReducedController.text,
      "timeReduced": timeReducedController.text,
      "sampleTemp": sampleTempController.text,
      "witness": witnessController.text,
      "witnessWAQTCNumber": wWAQTCNumberController.text,
      "boxSecurityTape": boxSecurityTapeController.text,
      "independentAssessorController": independentAssessorController.text,
      "serialNumController": serialNumController.text,
      "organizationController": organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
    };

    widget.db.setR47(dbMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("R47 Reducing Samples of Hot Mix Asphalt"),
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
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid date!";
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

                //Row 2 Begining
                TextFormField(
                  controller: labNumberController,
                  decoration: InputDecoration(
                      labelText: "Qualified Lab Number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Qualified Lab Number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: initReductionLocationController,
                  decoration: InputDecoration(
                      labelText: "Initial Reduction Location",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Initial Reduction Location";
                    return null;
                  },
                ),
                TextFormField(
                  controller: performedByController,
                  decoration: InputDecoration(
                      labelText: "Performed by (Electronic Signature) ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Electronic Signature";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "Witness WAQTC Number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: dateReducedController,
                  decoration: InputDecoration(
                      labelText: "Data Reduced",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Data Reduced Entry";
                    return null;
                  },
                ),
                TextFormField(
                  controller: timeReducedController,
                  decoration: InputDecoration(
                      labelText: "Time Reduced",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Time Reduced Entry";
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
                  style: TextStyle(color: Colors.black),
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
                          if (imgFile != null) {
                            setState(() {
                              _isLoading = true;
                            });
                          } else {
                            print('No image selected.');
                          }

                          sampTemp = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sampleTempController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sampleTempController,
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
                TextFormField(
                  controller: witnessController,
                  decoration: InputDecoration(
                      labelText: "Witnessed by (Electronic Signature) ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wWAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "Reduced By WAQTC Number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                        if (dropdownValue == "Select") {
                          _check = "0";
                        } else if (dropdownValue == "Acceptance") {
                          _check = "1";
                        } else if (dropdownValue == "B") {
                          _check = "2";
                        } else if (dropdownValue == "C") {
                          _check = "3";
                        } else {
                          _check = "4";
                        }
                      });
                    },
                    hint: Text(
                      "Requested Tests / Reason for Sample",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  "Box Security Tape Number",
                  style: TextStyle(color: Colors.black),
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
                          if (imgFile != null) {
                            setState(() {
                              _isLoading = true;
                            });
                          } else {
                            print('No image selected.');
                          }

                          tapeNum = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          boxSecurityTapeController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: boxSecurityTapeController,
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
                TextFormField(
                  controller: independentAssessorController,
                  decoration: InputDecoration(
                      labelText: "Independent Assessor Comments",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                      widget.db.loadValues();
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

  Widget _buildWidgetLoading() {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();
  }
}
