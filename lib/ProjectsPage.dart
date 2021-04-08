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
  void initState() {
    db.listProjects();
    super.initState();
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          //padding: EdgeInsets.only(left: 50, right: 50),

          //form

          // Column(//children: <Widget>[
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

        // ]
        // ),
      ),
    );
  }
}
