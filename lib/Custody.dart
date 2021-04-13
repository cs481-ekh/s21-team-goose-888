import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'FireBaseFireStoreDB.dart';

class Custody extends StatefulWidget {
  @override
  StoreDb db;
  Custody({Key key, @required this.db}) : super(key: key);
  _Custody createState() => _Custody();
}

class _Custody extends State<Custody> {
  var _formKey = GlobalKey<FormState>();
  String now = DateFormat("yyyy-MM-dd h:mm:ss a").format(DateTime.now());

  TextEditingController serialNumController;
  TextEditingController organizationController;
  TextEditingController sampleDateController;
  TextEditingController statusController;

  TextEditingController sampleCustodian1;
  TextEditingController wAQTCNumber1;
  TextEditingController receivedBy1;
  TextEditingController receivedWAQTCNumber1;
  TextEditingController details1;

  TextEditingController sampleCustodian2;
  TextEditingController wAQTCNumber2;
  TextEditingController receivedBy2;
  TextEditingController receivedWAQTCNumber2;
  TextEditingController details2;

  TextEditingController sampleCustodian3;
  TextEditingController wAQTCNumber3;
  TextEditingController receivedBy3;
  TextEditingController receivedWAQTCNumber3;
  TextEditingController details3;

  TextEditingController sampleCustodian4;
  TextEditingController wAQTCNumber4;
  TextEditingController receivedBy4;
  TextEditingController receivedWAQTCNumber4;
  TextEditingController details4;

  void dispose() {
    serialNumController.dispose();
    organizationController.dispose();
    sampleDateController.dispose();
    statusController.dispose();
    sampleCustodian1.dispose();
    wAQTCNumber1.dispose();
    receivedBy1.dispose();
    receivedWAQTCNumber1.dispose();
    details1.dispose();

    sampleCustodian2.dispose();
    wAQTCNumber2.dispose();
    receivedBy2.dispose();
    receivedWAQTCNumber2.dispose();
    details2.dispose();

    sampleCustodian3.dispose();
    wAQTCNumber3.dispose();
    receivedBy3.dispose();
    receivedWAQTCNumber3.dispose();
    details3.dispose();

    sampleCustodian4.dispose();
    wAQTCNumber4.dispose();
    receivedBy4.dispose();
    receivedWAQTCNumber4.dispose();
    details4.dispose();
    super.dispose();
  }

  void initState() {
    var _map = widget.db.getCustody();
    serialNumController =
        TextEditingController(text: _map["serialNumController"]);
    organizationController =
        TextEditingController(text: _map["organizationController"]);
    if(_map["sampleDateController"]==""){
      sampleDateController = TextEditingController(text: now);
    }else {
      sampleDateController =
          TextEditingController(text: _map["sampleDateController"]);
    }
    statusController = TextEditingController(text: _map["statusController"]);

    sampleCustodian1 = TextEditingController(text: _map["sampleCustodian1"]);
    wAQTCNumber1 = TextEditingController(text: _map["wAQTCNumber1"]);
    receivedBy1 = TextEditingController(text: _map["receivedBy1"]);
    receivedWAQTCNumber1 =
        TextEditingController(text: _map["receivedWAQTCNumber1"]);
    details1 = TextEditingController(text: _map["details1"]);

    sampleCustodian2 = TextEditingController(text: _map["sampleCustodian2"]);
    wAQTCNumber2 = TextEditingController(text: _map["wAQTCNumber2"]);
    receivedBy2 = TextEditingController(text: _map["receivedBy2"]);
    receivedWAQTCNumber2 =
        TextEditingController(text: _map["receivedWAQTCNumber2"]);
    details2 = TextEditingController(text: _map["details2"]);

    sampleCustodian3 = TextEditingController(text: _map["sampleCustodian3"]);
    wAQTCNumber3 = TextEditingController(text: _map["wAQTCNumber3"]);
    receivedBy3 = TextEditingController(text: _map["receivedBy3"]);
    receivedWAQTCNumber3 =
        TextEditingController(text: _map["receivedWAQTCNumber3"]);
    details3 = TextEditingController(text: _map["details3"]);

    sampleCustodian4 = TextEditingController(text: _map["sampleCustodian4"]);
    wAQTCNumber4 = TextEditingController(text: _map["wAQTCNumber4"]);
    receivedBy4 = TextEditingController(text: _map["receivedBy4"]);
    receivedWAQTCNumber4 =
        TextEditingController(text: _map["receivedWAQTCNumber4"]);
    details4 = TextEditingController(text: _map["details4"]);

    super.initState();
  }

  void createAddDbMap() {
    Map<String, dynamic> dbMap = {
      "serialNumController": serialNumController.text,
      "organizationController": organizationController.text,
      "sampleDateController": sampleDateController.text,
      "statusController": statusController.text,
      "sampleCustodian1": sampleCustodian1.text,
      "wAQTCNumber1": wAQTCNumber1.text,
      "receivedBy1": receivedBy1.text,
      "receivedWAQTCNumber1": receivedWAQTCNumber1.text,
      "details1": details1.text,
      "sampleCustodian2": sampleCustodian1.text,
      "wAQTCNumber2": wAQTCNumber1.text,
      "receivedBy2": receivedBy1.text,
      "receivedWAQTCNumber2": receivedWAQTCNumber1.text,
      "details2": details1.text,
      "sampleCustodian3": sampleCustodian1.text,
      "wAQTCNumber3": wAQTCNumber1.text,
      "receivedBy3": receivedBy1.text,
      "receivedWAQTCNumber3": receivedWAQTCNumber1.text,
      "details3": details1.text,
      "sampleCustodian4": sampleCustodian1.text,
      "wAQTCNumber4": wAQTCNumber1.text,
      "receivedBy4": receivedBy1.text,
      "receivedWAQTCNumber4": receivedWAQTCNumber1.text,
      "details4": details1.text,
    };

    widget.db.setCustody(dbMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chain of Custody"),
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
                  controller: sampleDateController,
                  decoration: InputDecoration(
                      labelText: "Sample Date ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.datetime,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid date!";
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
                  controller: sampleCustodian1,
                  decoration: InputDecoration(
                      labelText: "Sample Custodian",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Sample Custodian!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wAQTCNumber1,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedBy1,
                  decoration: InputDecoration(
                      labelText: "Received by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient Signature!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedWAQTCNumber1,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: details1,
                  decoration: InputDecoration(
                      labelText: "Details / Location / Condition of Sample",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter valid Details!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 2 ENDING

                //Row 3 BEGINNING
                TextFormField(
                  controller: sampleCustodian2,
                  decoration: InputDecoration(
                      labelText: "Sample Custodian ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Sample Custodian!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wAQTCNumber2,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedBy2,
                  decoration: InputDecoration(
                      labelText: "Received by ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient Signature!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedWAQTCNumber2,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: details2,
                  decoration: InputDecoration(
                      labelText: "Details / Location / Condition of Sample",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter valid Details!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 3 ENDING

                //Row 4 BEGINNING
                TextFormField(
                  controller: sampleCustodian3,
                  decoration: InputDecoration(
                      labelText: "Sample Custodian ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Sample Custodian!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wAQTCNumber3,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedBy3,
                  decoration: InputDecoration(
                      labelText: "Received by",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient Signature!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedWAQTCNumber3,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: details3,
                  decoration: InputDecoration(
                      labelText: "Details / Location / Condition of Sample",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter valid Details!";
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                //Row 4 ENDING

                //Row 5 BEGINNING
                TextFormField(
                  controller: sampleCustodian4,
                  decoration: InputDecoration(
                      labelText: "Sample Custodian",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Sample Custodian!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: wAQTCNumber4,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedBy4,
                  decoration: InputDecoration(
                      labelText: "Received by ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient Signature!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: receivedWAQTCNumber4,
                  decoration: InputDecoration(
                      labelText: "WAQTC Number ",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter a valid Recipient WAQTC Number!";
                    return null;
                  },
                ),
                TextFormField(
                  controller: details4,
                  decoration: InputDecoration(
                      labelText: "Details / Location / Condition of Sample",
                      labelStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (!RegExp("[a-zA-Z+0-9+.]?").hasMatch(value))
                      return "Enter valid Details!";
                    return null;
                  },
                ),
                //Row 5 ENDING

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                RaisedButton(
                  onPressed: () {
                    createAddDbMap();
                    widget.db.loadValues();
                    Navigator.pop(context);
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
