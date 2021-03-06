import 'package:flutter/material.dart';
import 'package:itd_888/FireBaseFireStoreDB.dart';
import 'package:itd_888/auth.dart';
class FormSections  extends StatefulWidget {

  @override
  final StoreDb db;
final  Auth auth;
  FormSections({Key key, @required this.db, this.auth}) : super(key: key);
  _FormSections createState() => _FormSections();


}
  class _FormSections extends State<FormSections> {
  var  projName;
    void initState() {

      projName =widget.db.getProjName();
      projName="Project Name: "+projName;

      super.initState();
    }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ITD-888 Section Selection"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            //padding: EdgeInsets.only(left: 50, right: 50),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      projName,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Loose Mix R97',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/LooseMixR97');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Chain of Custody',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Custody');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'R47',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/R47');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'T329',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/T329');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'T308',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/T308');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'T209',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/T209');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'T166',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/T166');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'T312',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/T312');
                    }),
                TextButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'T30',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/T30');
                    }),
                ButtonTheme(
                    minWidth: double.infinity,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          child: Text(
                            'Account Information',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/account');
                          },
                        ))),
              ],
            ),
          ),
        )));
  }
}
