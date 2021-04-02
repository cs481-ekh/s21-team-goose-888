import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:itd_888/FireBaseFireStoreDB.dart';

class T30 extends StatefulWidget {
  @override
  _T30 createState() => _T30();
}

class _T30 extends State<T30> {
  var result = "Result In Here";
  bool _isLoading = false;
  dynamic _extractText = "";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File pandsbwash,
      pbwash,
      sbwash,
      pandsawash,
      pawash,
      sawash,
      CMR2In,
      CMR1halfIn,
      CMR1In,
      CMR3fourthsIn,
      CMR3eightthsIn;
  File No4, No8, No16, No30, No50, No100, No200, Pan;

  StoreDb db;
  TextEditingController ocr1 = TextEditingController();
  TextEditingController ocr2 = TextEditingController();
  TextEditingController ocr3 = TextEditingController();

  TextEditingController ocr4 = TextEditingController();
  TextEditingController ocr5 = TextEditingController();
  TextEditingController ocr6 = TextEditingController();

  TextEditingController ocr7 = TextEditingController();
  TextEditingController ocr8 = TextEditingController();
  TextEditingController ocr9 = TextEditingController();
  TextEditingController ocr10 = TextEditingController();

  TextEditingController ocr11 = TextEditingController();
  TextEditingController ocr12 = TextEditingController();
  TextEditingController ocr13 = TextEditingController();
  TextEditingController ocr14 = TextEditingController();
  TextEditingController ocr15 = TextEditingController();

  TextEditingController ocr16 = TextEditingController();
  TextEditingController ocr17 = TextEditingController();

  TextEditingController aggregateCorrectFact50Controller =
      TextEditingController();
  TextEditingController aggregateCorrectFact37Controller =
      TextEditingController();
  TextEditingController aggregateCorrectFact25Controller =
      TextEditingController();
  TextEditingController aggregateCorrectFact19Controller =
      TextEditingController();
  TextEditingController aggregateCorrectFact9Controller =
      TextEditingController();
  TextEditingController aggregateCorrectNo4Controller = TextEditingController();
  TextEditingController aggregateCorrectNo8Controller = TextEditingController();
  TextEditingController aggregateCorrectNo16Controller =
      TextEditingController();
  TextEditingController aggregateCorrectNo30Controller =
      TextEditingController();
  TextEditingController aggregateCorrectNo50Controller =
      TextEditingController();
  TextEditingController aggregateCorrectNo100Controller =
      TextEditingController();
  TextEditingController aggregateCorrectNo200Controller =
      TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController testedByController = TextEditingController();
  TextEditingController testedByWAQTCController = TextEditingController();
  //zTextEditingController testedDateController = TextEditingController();
  TextEditingController retestFlaggedbyController = TextEditingController();
  TextEditingController retestFlaggedController = TextEditingController();
  TextEditingController retestCommentsController = TextEditingController();

  void dispose() {
    ocr1.dispose();
    ocr2.dispose();
    ocr3.dispose();

    ocr4.dispose();
    ocr5.dispose();
    ocr6.dispose();

    ocr7.dispose();
    ocr8.dispose();
    ocr9.dispose();
    ocr10.dispose();

    ocr11.dispose();
    ocr12.dispose();
    ocr13.dispose();
    ocr14.dispose();
    ocr15.dispose();

    ocr16.dispose();
    ocr17.dispose();

    aggregateCorrectFact50Controller.dispose();
    aggregateCorrectFact37Controller.dispose();
    aggregateCorrectFact25Controller.dispose();
    aggregateCorrectFact19Controller.dispose();
    aggregateCorrectFact9Controller.dispose();
    aggregateCorrectFact50Controller.dispose();
    aggregateCorrectFact50Controller.dispose();
    aggregateCorrectFact50Controller.dispose();
    aggregateCorrectFact50Controller.dispose();
    aggregateCorrectFact50Controller.dispose();
    aggregateCorrectNo4Controller.dispose();
    aggregateCorrectNo8Controller.dispose();
    aggregateCorrectNo16Controller.dispose();
    aggregateCorrectNo30Controller.dispose();
    aggregateCorrectNo50Controller.dispose();
    aggregateCorrectNo100Controller.dispose();
    aggregateCorrectNo200Controller.dispose();
    remarksController.dispose();
    testedByController.dispose();
    testedByWAQTCController.dispose();
    retestFlaggedbyController.dispose();
    retestFlaggedController.dispose();
    retestCommentsController.dispose();

    super.dispose();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {
      "panSampleBeforeWashMass": ocr1.text,
      "panBeforeWashMass": ocr2.text,
      "sampleBeforeWashMass": ocr3.text,
      "panSampleAfterWashMass": ocr4.text,
      "panAfterWashMass": ocr5.text,
      "sampleAfterWashMass": ocr6.text,
      "cMRGradation50": ocr7.text,
      "cMRGradation37": ocr8.text,
      "cMRGradation12": ocr9.text,
      "cMRGradation9": ocr10.text,
      "cMRNo4": ocr11.text,
      "cMRNo8": ocr12.text,
      "cMRNo16": ocr13.text,
      "cMRNo30": ocr14.text,
      "cMRNo100": ocr15.text,
      "cMRNo200": ocr16.text,
      "cMRPan": ocr17.text,
      "aggregateCorrectFact50": aggregateCorrectFact50Controller.text,
      "aggregateCorrectFact37": aggregateCorrectFact37Controller.text,
      "aggregateCorrectFact25": aggregateCorrectFact25Controller.text,
      "aggregateCorrectFact19": aggregateCorrectFact19Controller.text,
      "aggregateCorrectFact9": aggregateCorrectFact9Controller.text,
      "aggregateCorrectNo4": aggregateCorrectNo4Controller.text,
      "aggregateCorrectNo8": aggregateCorrectNo8Controller.text,
      "aggregateCorrectNo16": aggregateCorrectNo16Controller.text,
      "aggregateCorrectNo30": aggregateCorrectNo30Controller.text,
      "aggregateCorrectNo50": aggregateCorrectNo50Controller.text,
      "aggregateCorrectNo100": aggregateCorrectNo100Controller.text,
      "aggregateCorrectNo200": aggregateCorrectNo200Controller.text,
      "remarks": remarksController.text,
      "testedBy": testedByController.text,
      "testedByWAQTC": testedByWAQTCController.text,
      "retestFlaggedBy": retestFlaggedbyController.text,
      "retestFlagged": retestFlaggedController.text,
      "retestComments": retestCommentsController.text,
    };

    db.setT312(dbMap);
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
                      labelText: "Serial # ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid Number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Organization",
                      hintText: "Department",
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
                      labelText: "Sample Date ",
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
                  decoration: InputDecoration(
                      labelText: "Status",
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
                //Row 1 ENDING

                //Row 2 BEGINNING
                Text(
                  "Pan and Sample Before Wash Mass (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    pandsbwash == null
                        ? Text('No image selected.')
                        : Image.file(pandsbwash),
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

                          pandsbwash = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr1.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr1,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "Pan Before Wash Mass (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    pbwash == null
                        ? Text('No image selected.')
                        : Image.file(pbwash),
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

                          pbwash = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr2.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr2,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "Sample Before Wash Mass (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    sbwash == null
                        ? Text('No image selected.')
                        : Image.file(sbwash),
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

                          sbwash = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr3.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr3,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "Pan and Sample After Wash Mass (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    pandsawash == null
                        ? Text('No image selected.')
                        : Image.file(pandsawash),
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

                          pandsawash = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr4.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr4,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "Pan After Wash Mass (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    pawash == null
                        ? Text('No image selected.')
                        : Image.file(pawash),
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

                          pawash = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr5.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr5,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "Sample After Wash Mass (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    sawash == null
                        ? Text('No image selected.')
                        : Image.file(sawash),
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

                          sawash = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr6.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr6,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                Text(
                  "CMR Gradation 2 in. (50 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    CMR2In == null
                        ? Text('No image selected.')
                        : Image.file(CMR2In),
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

                          CMR2In = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr7.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr7,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR Gradation 1 1/2 in. (37.5 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    CMR1halfIn == null
                        ? Text('No image selected.')
                        : Image.file(CMR1halfIn),
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

                          CMR1halfIn = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr8.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr8,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR Gradation 3/4 in. (12.5 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    CMR3fourthsIn == null
                        ? Text('No image selected.')
                        : Image.file(CMR3fourthsIn),
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

                          CMR3fourthsIn = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr9.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr9,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR Gradation 3/8 in. (9.5 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    CMR3eightthsIn == null
                        ? Text('No image selected.')
                        : Image.file(CMR3eightthsIn),
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

                          CMR3eightthsIn = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr10.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr10,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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

                //Row 4 BEGINNING
                Text(
                  "CMR No. 4 (4.75 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    No4 == null ? Text('No image selected.') : Image.file(No4),
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

                          No4 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr11.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr11,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR No. 8 (2.36 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    No8 == null ? Text('No image selected.') : Image.file(No8),
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

                          No8 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr12.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr12,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR No. 16 (1.18 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    No16 == null
                        ? Text('No image selected.')
                        : Image.file(No16),
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

                          No16 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr13.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr13,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR No. 30 (0.600 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    No30 == null
                        ? Text('No image selected.')
                        : Image.file(No30),
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

                          No30 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr14.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr14,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR No. 100 (0.150 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    No100 == null
                        ? Text('No image selected.')
                        : Image.file(No100),
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

                          No100 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr15.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr15,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                // Row 4 Ending

                //Row 5 Begining
                Text(
                  "CMR No. 200 (0.075 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    No200 == null
                        ? Text('No image selected.')
                        : Image.file(No200),
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

                          No200 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr16.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr16,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                  "CMR Pan (-0.075 mm) ",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    Pan == null ? Text('No image selected.') : Image.file(Pan),
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

                          Pan = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          ocr17.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: ocr17,
                              keyboardType: TextInputType.number,
                              maxLines: null,
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value.isEmpty ||
                                    !RegExp("/^\d*\.?\d*\$/").hasMatch(value))
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
                // Row 5 Ending

                //Row 6 Begining
                TextFormField(
                  controller: aggregateCorrectFact50Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  2 in. (50mm)",
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
                  controller: aggregateCorrectFact37Controller,
                  decoration: InputDecoration(
                      labelText:
                          "Aggregate Correction Factor  1 1/2 in. (37.5 mm)",
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
                  controller: aggregateCorrectFact25Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  1 in. (25mm)",
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
                  controller: aggregateCorrectFact19Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  3/4 in. (19mm)",
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
                  controller: aggregateCorrectFact9Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  3/8 in. (9.5mm)",
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
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Ending Row 6

                //Begining Row 7
                TextFormField(
                  controller: aggregateCorrectNo4Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 4 (4.75 mm)",
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
                  controller: aggregateCorrectNo8Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 8 (2.36 mm)",
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
                  controller: aggregateCorrectNo16Controller,
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 16 (1.18 mm)",
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
                  controller: aggregateCorrectNo30Controller,
                  decoration: InputDecoration(
                      labelText:
                          "Aggregate Correction Factor No. 30 (0.600 mm)",
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
                  controller: aggregateCorrectNo50Controller,
                  decoration: InputDecoration(
                      labelText:
                          "Aggregate Correction Factor No. 50 (0.300 mm)",
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
                  controller: aggregateCorrectNo100Controller,
                  decoration: InputDecoration(
                      labelText:
                          "Aggregate Correction Factor No. 100 (0.150 mm)",
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
                  controller: aggregateCorrectNo200Controller,
                  decoration: InputDecoration(
                      labelText:
                          "Aggregate Correction Factor No. 200 (0.075 mm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Ending Row 7

                // Beginning Row 8
                TextFormField(
                  controller: remarksController,
                  decoration: InputDecoration(
                      labelText: "Remarks ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid remarks";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testedByController,
                  decoration: InputDecoration(
                      labelText: "Tested by ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testedByWAQTCController,
                  decoration: InputDecoration(
                      labelText: "Tested By WAQTC ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  //controller: testedDateController,
                  decoration: InputDecoration(
                      labelText: "Tested Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid date!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: retestFlaggedbyController,
                  decoration: InputDecoration(
                      labelText: "Retest Flagged by ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: retestFlaggedController,
                  decoration: InputDecoration(
                      labelText: "Retest Flagged ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: retestCommentsController,
                  decoration: InputDecoration(
                      labelText: "Retest Comments ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Independent Assessor ",
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
                //Ending Row 7
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
