import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:itd_888/FireBaseFireStoreDB.dart';

class T166 extends StatefulWidget {
  @override
  StoreDb db;
  T166({Key key, @required this.db}) : super(key: key);

  _T166 createState() => _T166();
}

class _T166 extends State<T166> {
  var result = "Result In Here";
  bool _isLoading = false;
  dynamic _extractText = "";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File puckd1, gpuckh2o1, wpuckSSD1, puckd2, gpuckh2o2, wpuckSSD2;
  //StoreDb db= StoreDb();


  TextEditingController puckd1Controller ;
  TextEditingController gpuckh2o1Controller ;
  TextEditingController wpuckSSD1Controller ;
  TextEditingController puckd2Controller ;
  TextEditingController gpuckh2o2Controller ;
  TextEditingController wpuckSSD2Controller ;


  TextEditingController serialNumController ;
  TextEditingController organizationController ;
  TextEditingController sampleDateController ;
  TextEditingController statusController ;

  TextEditingController remarksController ;
  TextEditingController testedByController ;
  TextEditingController testDateController;
  TextEditingController testedByWAQTCController;
  TextEditingController retestFlaggedbyController ;
  TextEditingController retestFlaggedController ;
  TextEditingController retestCommentsController;
  TextEditingController independentAssessorController ;


  void dispose() {

    puckd1Controller.dispose();
    gpuckh2o1Controller.dispose();
    wpuckSSD1Controller.dispose();
    puckd2Controller.dispose();
    gpuckh2o2Controller.dispose();
    wpuckSSD2Controller.dispose();


    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();

    remarksController.dispose();
    testedByController.dispose();
    testedByWAQTCController.dispose();
    retestFlaggedbyController.dispose();
    testDateController.dispose();
    retestFlaggedController.dispose();
    retestCommentsController.dispose();
    independentAssessorController.dispose();
    super.dispose();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {

      "puckd1": puckd1Controller.text,
      "gpuck2o1": gpuckh2o1Controller.text,
      "wpuckSSD1": wpuckSSD1Controller.text,
      "puckd2": puckd2Controller.text,
      "gpuckh2o2": gpuckh2o2Controller.text,
      "wpuckSSD2": wpuckSSD2Controller.text,


      "serialNumController":  serialNumController.text,
      "organizationController":  organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,

      "remarks": remarksController.text,
      "testedBy": testedByController.text,
      "testedByWAQTC": testedByWAQTCController.text,
      "testDate": testDateController.text,
      "retestFlaggedBy": retestFlaggedbyController.text,
      "retestFlagged": retestFlaggedController.text,
      "retestComments": retestCommentsController.text,
      "independentAssessorController": independentAssessorController.text,

    };
    widget.db.setT166(dbMap);
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
  void initState() {
    var _map = widget.db.getT166();
   puckd1Controller = TextEditingController(text: _map["puckd1"]);
     gpuckh2o1Controller = TextEditingController(text: _map["gpuck2o1"]);
      wpuckSSD1Controller = TextEditingController(text: _map["wpuckSSD1"]);
    puckd2Controller = TextEditingController(text: _map["puckd2"]);
     gpuckh2o2Controller = TextEditingController(text: _map["gpuckh2o2"]);
     wpuckSSD2Controller = TextEditingController(text: _map["wpuckSSD2"]);


     serialNumController = TextEditingController(text: _map["serialNumController"]);
     organizationController = TextEditingController(text: _map["organizationController"]);
    if (_map["sampleDateController"] == "" ||
        !_map.containsKey("sampleDateController")) {
      sampleDateController = TextEditingController(text: now);
    } else {
      sampleDateController =
          TextEditingController(text: _map["sampleDateController"]);
    }
     statusController = TextEditingController(text: _map["statusController"]);

     remarksController = TextEditingController(text: _map["remarks"]);
     testedByController = TextEditingController(text: _map["testedBy"]);
     testedByWAQTCController = TextEditingController(text: _map["testedByWAQTC"]);
    if (_map["testDate"] == "" ||
        !_map.containsKey("testDate")) {
      testDateController = TextEditingController(text: now);
    } else {
      testDateController =
          TextEditingController(text: _map["testDate"]);
    }
     //testedDateController = TextEditingController(text: now);
     retestFlaggedbyController = TextEditingController(text: _map["retestFlaggedBy"]);
     retestFlaggedController = TextEditingController(text: _map["retestFlagged"]);
     retestCommentsController = TextEditingController(text: _map["retestComments"]);
     independentAssessorController = TextEditingController(text: _map["independentAssessorController"]);
    super.initState();
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
                  controller: sampleDateController,
                  decoration: InputDecoration(
                      labelText: "Sample Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
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
                Text(
                  "Weight of Puck Dry 1 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    puckd1 == null
                        ? Text('No image selected.')
                        : Image.file(puckd1),
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

                          puckd1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          puckd1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: puckd1Controller,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid number";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Weight of Puck in Water 1 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    gpuckh2o1 == null
                        ? Text('No image selected.')
                        : Image.file(gpuckh2o1),
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

                          gpuckh2o1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          gpuckh2o1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: gpuckh2o1Controller,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid number";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Weight of Puck SSD 1 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    wpuckSSD1 == null
                        ? Text('No image selected.')
                        : Image.file(wpuckSSD1),
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

                          wpuckSSD1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          wpuckSSD1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: wpuckSSD1Controller,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid number";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
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
                  child: Column(children: [
                    puckd2 == null
                        ? Text('No image selected.')
                        : Image.file(puckd2),
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

                          puckd2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          puckd2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: puckd2Controller,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid number";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Weight of Puck in Water 2 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    gpuckh2o2 == null
                        ? Text('No image selected.')
                        : Image.file(gpuckh2o2),
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

                          gpuckh2o2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          gpuckh2o2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: gpuckh2o2Controller,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid number";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Weight of Puck SSD 2 ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    wpuckSSD2 == null
                        ? Text('No image selected.')
                        : Image.file(wpuckSSD2),
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

                          wpuckSSD2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          wpuckSSD2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: wpuckSSD2Controller,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid number";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING

                TextFormField(
                  controller: remarksController,
                  decoration: InputDecoration(
                      labelText: "Remarks",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                  controller: testedByController,
                  decoration: InputDecoration(
                      labelText: "Tested by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Name";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testedByWAQTCController,
                  decoration: InputDecoration(
                      labelText: "Tested by WAQTC",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testDateController,
                  decoration: InputDecoration(
                      labelText: "Tested Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid date!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 5 Ending

                //Row 6 Begining
                TextFormField(
                  controller: retestFlaggedbyController,
                  decoration: InputDecoration(
                      labelText: "Retest Flagged by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Name";
                    return null;
                  },
                ),
                TextFormField(
                  controller: retestFlaggedController,
                  decoration: InputDecoration(
                      labelText: "Retest Flagged",
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
                  controller: retestCommentsController,
                  decoration: InputDecoration(
                      labelText: "Retest Comments ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid comment";
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
                //Ending Row 7
                RaisedButton(
                  onPressed: () {
                    if (_submit()) {
                      createAddDbMap();
                      widget.db.loadValues();
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
