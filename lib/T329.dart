import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class T329 extends StatefulWidget {
  @override
  _T329 createState() => _T329();
}

class _T329 extends State<T329> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File pandsbwash, pbwash, sbwash, pandsawash, pawash, sawash, CMR2In, CMR1halfIn, CMR1In, CMR3fourthsIn, CMR3eightthsIn;
  File No4, No8, No16, No30, No50, No100, No200, Pan;


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
                      labelText: "Serial # *",
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
                Text(
                  "Pan and Sample Before Wash Mass (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    pandsbwash == null
                        ? Text('No image selected.')
                        : Image.file(pandsbwash),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              pandsbwash = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Pan Before Wash Mass (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    pbwash == null
                        ? Text('No image selected.')
                        : Image.file(pbwash),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              pbwash = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Sample Before Wash Mass (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    sbwash == null
                        ? Text('No image selected.')
                        : Image.file(sbwash),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              sbwash = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                //Row 2 Ending
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),

                /////////////////////////Row 3 BEGINNING
                Text(
                  "Pan and Sample After Wash Mass (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    pandsawash == null
                        ? Text('No image selected.')
                        : Image.file(pandsawash),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              pandsawash = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Pan After Wash Mass (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    pawash == null
                        ? Text('No image selected.')
                        : Image.file(pawash),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              pawash = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Sample After Wash Mass (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    sawash == null
                        ? Text('No image selected.')
                        : Image.file(sawash),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              sawash = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING
                Text(
                  "CMR Gradation 2 in. (50 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    CMR2In == null
                        ? Text('No image selected.')
                        : Image.file(CMR2In),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              CMR2In = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR Gradation 1 1/2 in. (37.5 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    CMR1halfIn == null
                        ? Text('No image selected.')
                        : Image.file( CMR1halfIn),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              CMR1halfIn = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR Gradation 3/4 in. (12.5 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    CMR3fourthsIn == null
                        ? Text('No image selected.')
                        : Image.file( CMR3fourthsIn),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              CMR3fourthsIn = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR Gradation 3/8 in. (9.5 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    CMR3eightthsIn == null
                        ? Text('No image selected.')
                        : Image.file( CMR3eightthsIn),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              CMR3eightthsIn = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING



                //Row 4 BEGINNING
                Text(
                  "CMR No. 4 (4.75 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    No4 == null
                        ? Text('No image selected.')
                        : Image.file( No4),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              No4 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR No. 8 (2.36 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    No8 == null
                        ? Text('No image selected.')
                        : Image.file(  No8),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              No8 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR No. 16 (1.18 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    No16 == null
                        ? Text('No image selected.')
                        : Image.file(  No16),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              No16 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR No. 30 (0.600 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    No30 == null
                        ? Text('No image selected.')
                        : Image.file(  No30),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              No30 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR No. 100 (0.150 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    No100 == null
                        ? Text('No image selected.')
                        : Image.file(  No100),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              No100 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 4 Ending

                //Row 5 Begining
                Text(
                  "CMR No. 200 (0.075 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    No200 == null
                        ? Text('No image selected.')
                        : Image.file(  No200),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              No200 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "CMR Pan (-0.075 mm) ",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    Pan == null
                        ? Text('No image selected.')
                        : Image.file(  Pan),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              Pan = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 5 Ending

                //Row 6 Begining
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  2 in. (50mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  1 1/2 in. (37.5 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  1 in. (25mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  3/4 in. (19mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor  3/8 in. (9.5mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
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
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 4 (4.75 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 8 (2.36 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 16 (1.18 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 30 (0.600 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 50 (0.300 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 100 (0.150 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Aggregate Correction Factor No. 200 (0.075 mm)",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
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
                  decoration: InputDecoration(
                      labelText: "Remarks ",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid number";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tested by *",
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
                      labelText: "Tested By WAQTC *",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value.isEmpty || !RegExp("/^\\S*\$/").hasMatch(value))
                      return "Enter a valid first name!";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tested Date *",
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
                      labelText: "Retest Flagged by *",
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
                      labelText: "Retest Flagged ",
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
                      labelText: "Retest Comments ",
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
                      labelText: "Independent Assessor ",
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
}