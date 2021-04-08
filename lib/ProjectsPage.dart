import 'package:flutter/material.dart';
import 'FireBaseFireStoreDB.dart';
import 'package:flutter/rendering.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPage createState() => _ProjectsPage();
}

class _ProjectsPage extends State<ProjectsPage> {
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  TextEditingController projectName = TextEditingController();
  TextEditingController bidItem = TextEditingController();
  void dispose() {
    projectName.dispose();
    bidItem.dispose();

    super.dispose();
  }
  void initState() {
    db.listProjects();
    super.initState();
  }
  void createProject() {
    db.createNewProject(projectName.text, bidItem.text);
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
  StoreDb db = StoreDb();

  Future<List> fetchData() async {
    return db.listProjects();
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
                  future: db.listProjects(),
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
                      Navigator.pushNamed(context, '/form');
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
                  onFieldSubmitted: (value) {

                  },
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
                  onFieldSubmitted: (value) {

                  },
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
   ]
        ),
      ),
    );

  }
}
