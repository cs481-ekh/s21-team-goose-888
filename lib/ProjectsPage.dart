import 'package:flutter/material.dart';
import 'FireBaseFireStoreDB.dart';
import 'package:flutter/rendering.dart';

class ProjectsPage extends StatefulWidget {
  @override
  StoreDb db;
  ProjectsPage({Key key, @required this.db}) : super(key: key);
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> {
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  //StoreDb db = StoreDb();
  TextEditingController projectName = TextEditingController();
  TextEditingController bidItem = TextEditingController();
  void dispose() {
    projectName.dispose();
    bidItem.dispose();

    super.dispose();
  }

  void initState() {
    widget.db.listProjects();
    super.initState();
  }

  void createProject() {
    widget.db.createNewProject(projectName.text, bidItem.text);
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
                        if(_dropDownValue=="Select Project"){
                          showAlertDialog(context);
                        }else{
                          widget.db.selectProject(_dropDownValue);
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
                    onPressed: () {
                      //bool check = ;
                      if (_submit()) {
                        createProject();
                        Navigator.pushNamed(context, '/form');
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




}
