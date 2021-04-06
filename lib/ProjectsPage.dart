import 'package:flutter/material.dart';
import 'FireBaseFireStoreDB.dart';
import 'package:flutter/rendering.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPage createState() => _ProjectsPage();
}
class _ProjectsPage extends State<ProjectsPage> {
  var formKey = GlobalKey<FormState>();
  void initState() {
   // getProjects();
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
  String _value = "";
  String value = "";
  StoreDb db=StoreDb();
  Future<List> fetchData() async {

   // List<String> list_items =db.listProjects() as List <String>;
   // List<String> list_items =  db.listProjects()  ;
    return db.listProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects Available"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
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
                FutureBuilder<List>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton(
                        value: value,
                        items: snapshot.data.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                        onChanged: (newValue) {

                          setState(() {
                            value = newValue;
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
    );
  }

}
