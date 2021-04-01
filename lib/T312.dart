
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'FireBaseFireStoreDB.dart';


class T312 extends StatefulWidget {
@override
_T312 createState() => _T312();
}

class _T312 extends State<T312> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File samp1,samp2;
  StoreDb db;
  TextEditingController serialNumController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController sampleDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController gyratoryBrandController = TextEditingController();
  TextEditingController gyratoryModelController = TextEditingController();
  TextEditingController gyratorySerialNumberController = TextEditingController();
  TextEditingController puckMassVolumetricController = TextEditingController();
  TextEditingController puckHeight1Controller = TextEditingController();
  TextEditingController  puckHeight2Controller = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController testedByController = TextEditingController();
  TextEditingController testedByWAQTCController = TextEditingController();
  TextEditingController testedDateController = TextEditingController();
  TextEditingController retestFlaggedByController = TextEditingController();
  TextEditingController retestFlaggedController = TextEditingController();
  TextEditingController retestCommentsController = TextEditingController();
  void dispose() {
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    gyratoryBrandController.dispose();
    gyratoryModelController.dispose();
    gyratorySerialNumberController.dispose();
    puckMassVolumetricController.dispose();
    puckHeight1Controller.dispose();
    puckHeight2Controller.dispose();
    remarksController.dispose();
    testedByController.dispose();
    testedByWAQTCController.dispose();
    retestFlaggedByController.dispose();
    retestFlaggedController.dispose();
    retestCommentsController.dispose();

    super.dispose();
  }

  void createAddDbMap(){
    Map<String, dynamic> dbMap = {
      "serialNumController":  serialNumController.text,
      "organizationController":  organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
      "gyratoryBrand": gyratoryBrandController.text,
      "gyratoryModel": gyratoryModelController.text,
      "gyratorySerialNumber" : gyratorySerialNumberController.text,
      "puckMassVolumetric": puckMassVolumetricController.text,
      "puckHeight1":  puckHeight1Controller.text,
      "puckHeight2":  puckHeight2Controller.text,
      "remarks": remarksController.text,
      "testedBy": testedByController.text,
      "testedByWAQTC" : testedByWAQTCController.text,
      "retestFlaggedBy": retestFlaggedByController.text,
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
        title: Text("T312 Gyratory Compactor"),
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
                  controller: gyratoryBrandController,
                  decoration: InputDecoration(
                      labelText: "Gyratory Brand",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid brand";
                    return null;
                  },
                ),
                TextFormField(
                  controller: gyratoryModelController,
                  decoration: InputDecoration(
                      labelText: "Gyratory Model",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid model";
                    return null;
                  },
                ),
                TextFormField(
                  controller: gyratorySerialNumberController,
                  decoration: InputDecoration(
                      labelText: "Gyratory Serial Number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  controller: puckMassVolumetricController,
                  decoration: InputDecoration(
                      labelText: "Puck Mass Volumetric",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                //Row 2 Ending
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),

                /////////////////////////Row 3 BEGINNING
                Text(
                  "Mass of Sample 1 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    samp1 == null
                        ? Text('No image selected.')
                        : Image.file(samp1),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              samp1 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                TextFormField(
                  controller: puckHeight1Controller,
                  decoration: InputDecoration(
                      labelText: "Puck Height 1 (mm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING
                Text(
                  "Mass of Sample 2 (g)",
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    samp2 == null
                        ? Text('No image selected.')
                        : Image.file(samp2),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              samp2 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                TextFormField(
                  controller: puckHeight2Controller,
                  decoration: InputDecoration(
                      labelText: "Puck Height 2 (mm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
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
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid remark";
                    return null;
                  },
                ),
                //Row 4 BEGINNING

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 4 Ending

                //Row 5 Begining
                TextFormField(
                  controller: testedByController,
                  decoration: InputDecoration(
                      labelText: "Tested by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid name";
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
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(

                  decoration: InputDecoration(
                      labelText: "Tested Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  initialValue: now,
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value)) return "Enter a valid date!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 5 Ending

                //Row 6 Begining
                TextFormField(
                  controller: retestFlaggedByController,
                  decoration: InputDecoration(
                      labelText: "Retest Flagged by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid comment";
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