import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'FireBaseFireStoreDB.dart';

class T308 extends StatefulWidget {
  @override
  StoreDb db;
  T308({Key key, @required this.db}) : super(key: key);
  _T308 createState() => _T308();
}

class _T308 extends State<T308> {
  var result = "Result In Here";
  bool _isLoading = false;
  dynamic _extractText = "";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File initial, assembly, fin;

  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      _formKey.currentState.save();
      return true;
    }
  }

  TextEditingController serialNumController;
  TextEditingController organizationController;
  TextEditingController sampleDateController;
  TextEditingController statusController;

  TextEditingController furnaceController = TextEditingController();
  TextEditingController dateTicketController = TextEditingController();
  TextEditingController ticketACController = TextEditingController();
  TextEditingController timeTicketController = TextEditingController();
  TextEditingController basketInitialController = TextEditingController();
  TextEditingController basketAssemblyController = TextEditingController();
  TextEditingController calculatedInitialController = TextEditingController();
  TextEditingController basketFinalController = TextEditingController();
  TextEditingController t308TestedController = TextEditingController();
  TextEditingController testedWAQTCController = TextEditingController();
  TextEditingController testedDateController = TextEditingController();
  TextEditingController independentAssessorController = TextEditingController();

  void initState() {
    var _map = widget.db.getT308();

    serialNumController =
        TextEditingController(text: _map["serialNumController"]);
    organizationController =
        TextEditingController(text: _map["organizationController"]);
    sampleDateController = TextEditingController(text: now);
    statusController = TextEditingController(text: _map["statusController"]);

    furnaceController = TextEditingController(text: _map["furnace"]);
    dateTicketController = TextEditingController(text: _map["dateTicket"]);
    ticketACController = TextEditingController(text: _map["ticketAC"]);
    timeTicketController = TextEditingController(text: _map["timeTicket"]);
    basketInitialController =
        TextEditingController(text: _map["basketInitial"]);
    basketAssemblyController =
        TextEditingController(text: _map["basketAssembly"]);
    calculatedInitialController =
        TextEditingController(text: _map["calculatedInitial"]);
    basketFinalController = TextEditingController(text: _map["basketFinal"]);
    t308TestedController = TextEditingController(text: _map["t308Tested"]);
    testedWAQTCController = TextEditingController(text: _map["testedWQATC"]);
    testedDateController = TextEditingController(text: _map["testedDate"]);
    independentAssessorController =
        TextEditingController(text: _map["indepdentAssessor"]);

    super.initState();
  }

  void dispose() {
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    furnaceController.dispose();
    dateTicketController.dispose();
    ticketACController.dispose();
    timeTicketController.dispose();
    basketInitialController.dispose();
    basketAssemblyController.dispose();
    calculatedInitialController.dispose();
    basketFinalController.dispose();
    t308TestedController.dispose();
    testedWAQTCController.dispose();
    testedDateController.dispose();
    independentAssessorController.dispose();

    super.dispose();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {
      "serialNumController": serialNumController.text,
      "organizationController": organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
      "furnace": furnaceController.text,
      "dateTicket": dateTicketController.text,
      "ticketAC": ticketACController.text,
      "timeTicket": timeTicketController.text,
      "basketInitial": basketInitialController.text,
      "basketAssembly": basketAssemblyController.text,
      "calculatedInitial": calculatedInitialController.text,
      "basketFinal": basketFinalController.text,
      "t308Tested": t308TestedController.text,
      "testedWQATC": testedWAQTCController.text,
      "testedDate": testedDateController.text,
      "indepdentAssessor": independentAssessorController.text,
    };

    widget.db.setT308(dbMap);
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

                //Row 2 BEGINNING
                TextFormField(
                  controller: furnaceController,
                  decoration: InputDecoration(
                      labelText: "Furnace ID ",
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
                  controller: dateTicketController,
                  decoration: InputDecoration(
                      labelText: "Date on Ticket",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Date!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: ticketACController,
                  decoration: InputDecoration(
                      labelText: "Ticket AC % ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a Number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: timeTicketController,
                  decoration: InputDecoration(
                      labelText: "Time on Ticket ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Time!";
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
                    initial == null
                        ? Text('No image selected.')
                        : Image.file(initial),
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

                          initial = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          basketInitialController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: basketInitialController,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid Basket and Initial Sample!";
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
                  "Basket Assembly",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    assembly == null
                        ? Text('No image selected.')
                        : Image.file(assembly),
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

                          assembly = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          basketAssemblyController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: basketAssemblyController,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid Number!";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                TextFormField(
                  controller: calculatedInitialController,
                  decoration: InputDecoration(
                      labelText: "Calculated Initial Sample ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Number!";
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
                    fin == null ? Text('No image selected.') : Image.file(fin),
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

                          fin = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          basketFinalController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: basketFinalController,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                                  return "Enter a valid Number!";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Ending Row 3

                //Row 4 BEGINNING
                TextFormField(
                  controller: t308TestedController,
                  decoration: InputDecoration(
                      labelText: "T308 Tested by ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid entry!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testedWAQTCController,
                  decoration: InputDecoration(
                      labelText: "Tested by WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testedDateController,
                  decoration: InputDecoration(
                      labelText: "Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid date!";
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
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                      createAddDbMap();
                      widget.db.loadValues();
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
