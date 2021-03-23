import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'FireBaseFireStoreDB.dart';

class LooseMixR97 extends StatefulWidget {
  @override
  _LooseMixR97 createState() => _LooseMixR97();
}

class _LooseMixR97 extends State<LooseMixR97> {
  String dropdownValue = "Select";
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File sampleTemp, sampleLoc;
  StoreDb db;
  TextEditingController bidItemController = TextEditingController();
  TextEditingController projectNumberController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController randomNumberController = TextEditingController();
  TextEditingController quantityRepresentedController = TextEditingController();
  TextEditingController sendReportsToController = TextEditingController();
  TextEditingController sampledByController = TextEditingController();
  TextEditingController WAQTCNumberController = TextEditingController();
  TextEditingController witnessedByController = TextEditingController();
  TextEditingController wWAQTCNumberController = TextEditingController();
  TextEditingController sampleIDNumberController = TextEditingController();
  void dispose() {
     bidItemController.dispose();
     projectNumberController.dispose();
     projectNameController.dispose();
    districtController.dispose();
     randomNumberController.dispose();
     quantityRepresentedController.dispose();
     sendReportsToController.dispose();
     sampledByController.dispose();
     WAQTCNumberController.dispose();
     witnessedByController.dispose();
     wWAQTCNumberController.dispose();
     sampleIDNumberController.dispose();
    super.dispose();
  }

  void createAddDbMap(){
    Map<String, dynamic> dbMap = {
    "bidItem": bidItemController.text,
    "projectNumber": projectNumberController.text,
    "projectName" :projectNameController.text,
    "district": districtController.text,
    "reandomNumber": randomNumberController.text,
    "quantityRepresented": quantityRepresentedController.text,
    "sendReportsTo": sendReportsToController.text,
    "sampledBy": sampledByController,
    "WAQTCNumber":WAQTCNumberController.text,
    "witnessedBy":witnessedByController.text,
    "sampleIDNumber": sampleIDNumberController.text,
    "witnessWAQTCNumber": wWAQTCNumberController.text,
    };

    db.setR97(dbMap);

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

                  decoration: InputDecoration(
                      labelText: "Serial # *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Organization *",
                      hintText: "Department",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Sample Date *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
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
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 1 ENDING

                //Row 2 BEGINNING
                TextFormField(
                  controller:bidItemController ,
                  decoration: InputDecoration(
                      labelText: "Bid Item / Key Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: projectNumberController,
                  decoration: InputDecoration(
                      labelText: "Project Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: projectNameController,
                  decoration: InputDecoration(
                      labelText: "Project Name *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: districtController,
                  decoration: InputDecoration(
                      labelText: "District *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: randomNumberController,
                  decoration: InputDecoration(
                      labelText: "Random Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
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
                  style: TextStyle(color: Colors.red),
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
                          setState(() {
                            if (imgFile != null) {
                              sampleTemp = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  "Sample Location",
                  style: TextStyle(color: Colors.red),
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
                TextFormField(
                  controller: quantityRepresentedController,
                  decoration: InputDecoration(
                      labelText: "Quantity Represented (Tons) *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
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
                TextFormField(
                  controller: sendReportsToController ,
                  decoration: InputDecoration(
                      labelText: "Send Reports To: *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
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
                      labelText: "Sampled by (Electronic Signature) *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: WAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: witnessedByController,
                  decoration: InputDecoration(
                      labelText: "Witnessed by (Electronic Signature) *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wWAQTCNumberController,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: sampleIDNumberController,
                  decoration: InputDecoration(
                      labelText: "Sample ID Number *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                //Row 4 ENDING

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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
