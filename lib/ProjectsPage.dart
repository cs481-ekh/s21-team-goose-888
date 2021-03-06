import 'package:flutter/material.dart';
import 'package:itd_888/auth.dart';
import 'FireBaseFireStoreDB.dart';
import 'package:flutter/rendering.dart';

class ProjectsPage extends StatefulWidget {
  @override
  StoreDb db;
  ProjectsPage({Key key, @required this.db, Auth auth}) : super(key: key);
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> {
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  Map<String, dynamic> projNameMap;
  TextEditingController projectName = TextEditingController();
  TextEditingController bidItem = TextEditingController();
  void dispose() {
    projectName.dispose();
    bidItem.dispose();

    super.dispose();
  }

  void initState() {
    widget.db.loadMapNames();
    widget.db.listProjects();
    projNameMap = widget.db.getMapNames();
    //print(projNameMap);

    super.initState();
  }

  void createProject() {
    widget.db.createNewProject(
      bidItem.text,
      projectName.text,
    );
  }

  var isLoading = false;
  //String textEmail = "";

  bool _submit() {
    final isValid = formKey.currentState.validate();
    if (!isValid) {
      return false;
    } else {
      formKey.currentState.save();
      return true;
    }
  }

  // Future List<String> list_items;
  String _dropDownValue = "Select Project";
  String value = "";

  Future<List> fetchData() async {
    return widget.db.listProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects Available"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.only(left: 50, right: 50),

        //form
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            //  Padding(
            //padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  FutureBuilder<List<String>>(
                    future: widget.db.listProjects(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButton(
                          isExpanded: true,
                          value: _dropDownValue,
                          items: snapshot.data.map((value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _dropDownValue = newValue;
                            });
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 10.0,
                    ),
                    child: Text(
                      "Go to Project",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      //bool check = ;
                      if (_submit()) {
                        if (_dropDownValue == "Select Project") {
                          showAlertDialog(context);
                        } else {
                          widget.db.setProjectFromName(_dropDownValue);
                          widget.db.loadValues();
                          Navigator.pushNamed(context, '/form');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            //  Padding(
            //padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey2,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: projectName,
                    decoration: InputDecoration(labelText: "Project Name"),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid project name!';
                      }
                      //textEmail=value;
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: bidItem,
                    decoration: InputDecoration(labelText: "Bid Item"),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid bid item!';
                      }
                      //textEmail=value;
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 10.0,
                    ),
                    child: Text(
                      "Create Project",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () async {
                      List projectList;
                      if (_submit()) {
                        print(projNameMap);
                        await widget.db
                            .listProjects()
                            .then((value) => projectList = value);
                        if (projectList.contains(projectName.text)) {
                          showSameNameAlertDialog(context);
                        } else {
                          createProject();
                          widget.db.loadMapNames();
                          Navigator.pushNamed(context, '/form');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("No Project Selected"),
      content: Text("You must either select a project or create one"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showSameNameAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Same Project Name"),
      content: Text("Please use project name that has not been used already"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
