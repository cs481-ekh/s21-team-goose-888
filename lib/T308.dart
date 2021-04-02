import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:itd_888/FireBaseFireStoreDB.dart';

class T308 extends StatefulWidget {
  @override
  _T308 createState() => _T308();
}

class _T308 extends State<T308> {
  var result = "Result In Here";
  bool _isLoading = false;
  dynamic _extractText = "";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File initial, assembly, fin;
  StoreDb db;

  TextEditingController initialController = TextEditingController();
  TextEditingController assemblyController = TextEditingController();
  TextEditingController basketFinalController = TextEditingController();

  void dispose() {
    initialController.dispose();
    assemblyController.dispose();
    basketFinalController.dispose();
    super.dispose();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {
      "basksetInitialSamp": initialController.text,
      "assemblyController ": assemblyController.text,
      "basketFinalAggregate": basketFinalController,
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
                  decoration: InputDecoration(
                      labelText: "Serial # *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid Serial Number!";
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

                //Row 2 BEGINNING
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Furnace ID *",
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
                      labelText: "Date on Ticket *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("[a-zA-Z]").hasMatch(value))
                      return "Enter a valid Date!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Ticket AC % *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a Number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Time on Ticket *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("[a-zA-Z]").hasMatch(value))
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
                  style: TextStyle(color: Colors.red),
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
                          initialController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: initialController,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  style: TextStyle(color: Colors.red),
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
                          assemblyController.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: assemblyController,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
                                  return "Enter a valid Number!";
                                return null;
                              },
                            ),
                    )
                  ]),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Calculated Initial Sample *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid Number!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "Basket & Final Aggregate",
                  style: TextStyle(color: Colors.red),
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
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  decoration: InputDecoration(
                      labelText: "T308 Tested by *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid entry!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "WAQTC Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Date *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.datetime,
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

  Widget _buildWidgetLoading() {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();
  }
}
