import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:itd_888/FireBaseFireStoreDB.dart';

class T209 extends StatefulWidget {
  @override
  StoreDb db;
  T209({Key key, @required this.db}) : super(key: key);
  _T209 createState() => _T209();
}

class _T209 extends State<T209> {
  var result = "Result In Here";
  bool _isLoading = false;
  dynamic _extractText = "";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File massbandsample1,
      massofb1,
      massofdinair1,
      massbandsamplesub1,
      massofbsub1,
      massofsamplesub1,
      massbandsample2,
      massofb2,
      massofdinair2,
      massbandsamplesub2,
      massofbsub2,
      massofsamplesub2;
  //StoreDb db= StoreDb();

  TextEditingController independentAssessorController;
  TextEditingController mBS1Controller ;
  TextEditingController mB1Controller ;
  TextEditingController mDSA1Controller ;
  TextEditingController sWBS1Controller ;
  TextEditingController sWB1Controller ;
  TextEditingController sWS1Controller ;

  TextEditingController mBS2Controller ;
  TextEditingController mB2Controller ;
  TextEditingController mDSA2Controller ;
  TextEditingController sWBS2Controller ;
  TextEditingController sWB2Controller ;
  TextEditingController sWS2Controller ;


  TextEditingController serialNumController ;
  TextEditingController organizationController ;
  TextEditingController sampleDateController ;
  TextEditingController statusController;

  TextEditingController remarksController;
  TextEditingController testedByController ;
  TextEditingController testedByWAQTCController ;
  TextEditingController retestFlaggedbyController ;
  TextEditingController retestFlaggedController;
  TextEditingController testDateController ;
  TextEditingController retestCommentsController ;



  void createAddDbMap() {
    Map<String, dynamic> dbMap = {

      "independentAssessorController": independentAssessorController.text,
      "mBs1": mBS1Controller.text,
      "mB1": mB1Controller.text,
      "mDSA1": mDSA1Controller.text,
      "sWBS1": sWBS1Controller.text,
      "sWB1": sWB1Controller.text,
      "sWS1": sWS1Controller.text,
      "mBS2": mBS2Controller.text,
      "mB2": mB2Controller.text,
      "mDSA2": mDSA2Controller.text,
      "sWBS2": sWBS2Controller.text,
      "sWB2": sWB2Controller.text,
      "sWS2": sWS2Controller.text,

      "serialNumController":  serialNumController.text,
      "organizationController":  organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,

      "remarks": remarksController.text,
      "testedBy": testedByController.text,
      "testedByWAQTC": testedByWAQTCController.text,
      "retestFlaggedBy": retestFlaggedbyController.text,
      "testDate": testDateController.text,
      "retestFlagged": retestFlaggedController.text,
      "retestComments": retestCommentsController.text,
    };

    widget.db.setT209(dbMap);
  }
  void dispose() {

    mBS1Controller.dispose();
    mB1Controller.dispose();
    mDSA1Controller.dispose();
    sWBS1Controller.dispose();
    sWB1Controller.dispose();
    sWS1Controller.dispose();

    mBS2Controller.dispose();
    mB2Controller.dispose();
    mDSA2Controller.dispose();
    sWBS2Controller.dispose();
    sWB2Controller.dispose();
    sWS2Controller.dispose();


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
    independentAssessorController.dispose();
    testDateController.dispose();
    super.dispose();
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

  // bool rememberMe = false;
  //
  // void _onRememberMeChanged(bool newValue) => setState(() {
  //       rememberMe = newValue;
  //
  //       if (rememberMe) {
  //         // TODO: Here goes your functionality that remembers the user.
  //       } else {
  //         // TODO: Forget the user
  //       }
    //  });
  void initState() {
    var _map = widget.db.getT209();
    independentAssessorController = TextEditingController(text: _map["independentAssessorController"]);
    mBS1Controller = TextEditingController(text: _map["mBs1"]);
     mB1Controller = TextEditingController(text: _map["mB1"]);
    mDSA1Controller = TextEditingController(text: _map["mDSA1"]);
    sWBS1Controller = TextEditingController(text: _map["sWBS1"]);
    sWB1Controller = TextEditingController(text: _map["sWB1"]);
     sWS1Controller = TextEditingController(text: _map["sWS1"]);

     mBS2Controller = TextEditingController(text: _map["mBS2"]);
     mB2Controller = TextEditingController(text: _map["mB2"]);
     mDSA2Controller = TextEditingController(text: _map["mDSA2"]);
     sWBS2Controller = TextEditingController(text: _map["sWBS2"]);
     sWB2Controller = TextEditingController(text: _map["sWB2"]);
    sWS2Controller = TextEditingController(text: _map["sWS2"]);


    serialNumController = TextEditingController(text: _map["serialNumController"]);
    organizationController = TextEditingController(text: _map["organizationController"]);
    //sampleDateController = TextEditingController();
    if(_map["sampleDateController"]==""){
      sampleDateController = TextEditingController(text: now);
    }else {
      sampleDateController =
          TextEditingController(text: _map["sampleDateController"]);
    }
     statusController = TextEditingController(text: _map["statusController"]);

    remarksController = TextEditingController(text: _map["remarks"]);
    testedByController = TextEditingController(text: _map["testedBy"]);
    testedByWAQTCController = TextEditingController(text: _map["testedByWAQTC"]);

    if(_map["testDate"]==""){
      testDateController = TextEditingController(text: now);
    }else {
      testDateController = TextEditingController(text: _map["testDate"]);
    }
    //testedDateController = TextEditingController();
    retestFlaggedbyController = TextEditingController(text: _map["retestFlaggedby"]);
    retestFlaggedController = TextEditingController(text: _map["retestFlagged"]);
    retestCommentsController = TextEditingController(text: _map["retestComments"]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("T209 Max Specific Gravity"),
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
                  keyboardType: TextInputType.text,
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
                  "Mass of Bowl and Sample 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massbandsample1 == null
                        ? Text('No image selected.')
                        : Image.file(massbandsample1),
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

                          massbandsample1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          mBS1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: mBS1Controller,
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
                  "Mass of Bowl 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofb1 == null
                        ? Text('No image selected.')
                        : Image.file(massofb1),
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

                          massofb1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          mB1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: mB1Controller,
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
                  "Mass of Dry Sample in Air 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofdinair1 == null
                        ? Text('No image selected.')
                        : Image.file(massofdinair1),
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

                          massofdinair1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          mDSA1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: mDSA1Controller,
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
                  "Submerged Weight of Bowl and Sample 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massbandsamplesub1 == null
                        ? Text('No image selected.')
                        : Image.file(massbandsamplesub1),
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

                          massbandsamplesub1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sWBS1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sWBS1Controller,
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
                  "Submerged Weight of Bowl 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofbsub1 == null
                        ? Text('No image selected.')
                        : Image.file(massofbsub1),
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

                          massofbsub1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sWB1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sWB1Controller,
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
                  "Submerged Weight of Sample 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofsamplesub1 == null
                        ? Text('No image selected.')
                        : Image.file(massofsamplesub1),
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

                          massofsamplesub1 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sWS1Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sWS1Controller,
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

                //Row 2 Ending
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),

                /////////////////////////Row 3 BEGINNING
                Text(
                  "Mass of Bowl and Sample 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massbandsample2 == null
                        ? Text('No image selected.')
                        : Image.file(massbandsample2),
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

                          massbandsample2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          mBS2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: mBS2Controller,
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
                  "Mass of Bowl 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofb2 == null
                        ? Text('No image selected.')
                        : Image.file(massofb2),
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

                          massofb2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          mB2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: mB2Controller,
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
                  "Mass of Dry Sample in Air 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofdinair2 == null
                        ? Text('No image selected.')
                        : Image.file(massofdinair2),
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

                          massofdinair2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          mDSA2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: mDSA2Controller,
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
                  "Submerged Weight of Bowl and Sample 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massbandsamplesub2 == null
                        ? Text('No image selected.')
                        : Image.file(massbandsamplesub2),
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

                          massbandsamplesub2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sWBS2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sWBS2Controller,
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
                  "Submerged Weight of Bowl 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofbsub2 == null
                        ? Text('No image selected.')
                        : Image.file(massofbsub2),
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

                          massofbsub2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sWB2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sWB2Controller,
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
                  "Submerged Weight of Sample 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child: Column(children: [
                    massofsamplesub2 == null
                        ? Text('No image selected.')
                        : Image.file(massofsamplesub2),
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

                          massofsamplesub2 = File(imgFile.path);
                          var visionImage =
                              FirebaseVisionImage.fromFile(imgFile);
                          var _recognizer =
                              FirebaseVision.instance.textRecognizer();
                          var _extractText =
                              await _recognizer.processImage(visionImage);
                          result = '${_extractText.text}';
                          result = result.replaceAll(new RegExp("[^\\d.]"), "");
                          print(result);
                          sWS2Controller.text = result;
                          _recognizer.close();
                          setState(() {
                            _isLoading = false;
                          });
                        }),
                    Center(
                      child: _isLoading
                          ? _buildWidgetLoading()
                          : TextFormField(
                              controller: sWS2Controller,
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
                      return "Enter a valid name";
                    return null;
                  },
                ),
                TextFormField(
                  controller: testedByWAQTCController,
                  decoration: InputDecoration(
                      labelText: "Tested by WAQTC",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid name";
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
                      return "Enter a valid ";
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
