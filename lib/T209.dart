import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class T209 extends StatefulWidget {
  @override
  _T209 createState() => _T209();
}

class _T209 extends State<T209> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());
  File massbandsample1, massofb1, massofdinair1, massbandsamplesub1,massofbsub1,massofsamplesub1,massbandsample2, massofb2, massofdinair2, massbandsamplesub2,massofbsub2,massofsamplesub2 ;
  bool _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      _formKey.currentState.save();
      return true;
    }
  }
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;

    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });
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
                Text(
                  "Mass of Bowl and Sample 1 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massbandsample1 == null
                        ? Text('No image selected.')
                        : Image.file(massbandsample1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massbandsample1 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Mass of Bowl 1 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofb1 == null
                        ? Text('No image selected.')
                        : Image.file(massofb1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofb1  = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Mass of Dry Sample in Air 1 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                   massofdinair1== null
                        ? Text('No image selected.')
                        : Image.file(massofdinair1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofdinair1 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Submerged Weight of Bowl and Sample 1 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massbandsamplesub1== null
                        ? Text('No image selected.')
                        : Image.file(massbandsamplesub1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massbandsamplesub1= File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Submerged Weight of Bowl 1 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofbsub1== null
                        ? Text('No image selected.')
                        : Image.file(massofbsub1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofbsub1 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Submerged Weight of Sample 1 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofsamplesub1== null
                        ? Text('No image selected.')
                        : Image.file(massofsamplesub1 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofsamplesub1 = File(imgFile.path);
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
                  "Mass of Bowl and Sample 2 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massbandsample2== null
                        ? Text('No image selected.')
                        : Image.file(massbandsample2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massbandsample2 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Mass of Bowl 2 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofb2 == null
                        ? Text('No image selected.')
                        : Image.file(massofb2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofb2 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Mass of Dry Sample in Air 2 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofdinair2== null
                        ? Text('No image selected.')
                        : Image.file(massofdinair2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofdinair2 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Submerged Weight of Bowl and Sample 2 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massbandsamplesub2== null
                        ? Text('No image selected.')
                        : Image.file(massbandsamplesub2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massbandsamplesub2= File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Submerged Weight of Bowl 2 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofbsub2== null
                        ? Text('No image selected.')
                        : Image.file(massofbsub2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofbsub2 = File(imgFile.path);
                            } else {
                              print('No image selected.');
                            }
                          });
                        }
                    ),
                  ] ),),
                Text(
                  "Submerged Weight of Sample 2 (g)",
                  style: TextStyle(color: Colors.red),
                ),
                Container(
                  width: double.infinity,
                  child : Column(children: [
                    massofsamplesub2== null
                        ? Text('No image selected.')
                        : Image.file(massofsamplesub2 ),
                    RaisedButton(
                        child: Text('Choose Photo'),
                        onPressed: ()async {
                          var imgFile = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            if (imgFile != null) {
                              massofsamplesub2 = File(imgFile.path);
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

                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Remarks",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
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
                  decoration: InputDecoration(
                      labelText: "Tested by",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z]").hasMatch(value))
                      return "Enter a valid name";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Tested by WAQTC",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid number";
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
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                // Row 5 Ending

                //Row 6 Begining
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Retest Flagged by",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid name";
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Retest Flagged",
                      labelStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if ( !RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid ";
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



