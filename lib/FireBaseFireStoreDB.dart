import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class FireStoreDb {
  // current project will be the id of the selected project
  //this id will be used to reference all other parts of the form.
  var currentProject;
  var projName;
  var currentUser;


  //each map will reference the subsections and their data
  Map<String, dynamic> r97;
  Map<String, dynamic> custody;
  Map<String, dynamic> r47;
  Map<String, dynamic> t329;
  Map<String, dynamic> t30;
  Map<String, dynamic> t308;
  Map<String, dynamic> t209;
  Map<String, dynamic> t166;
  Map<String, dynamic> t312;
  Map<String, dynamic> mapNames;


  // First set of methods are methods to get info from the ITD-888 collection
  String getSerialNumber();
  Future<String> getStatus();
  Future<String> getBidItem();
  Future<String> getProjectName();
  String getProjName();
  void selectProject(String serialNumber);
  CollectionReference getProjects();
  CollectionReference getUsers();
  Future<List> listProjects();
  Map<String, dynamic>  getMapNames();
  Future<void> addNewUser(String firstName, String lastName, String email, String waqtcNumber);
  Future<Map> getUserInfo();

  // this method creates a new document in the ITD-888 collection with an
  //auto generated id
  void createNewProject(String bidItem, String projectName);
}

class StoreDb implements FireStoreDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var currentProject = 0;
  var currentUser = 0;

  var projName="";

  @override
  Map<String, dynamic> custody;
  Map<String, dynamic> r47;
  Map<String, dynamic> r97;
  Map<String, dynamic> t166;
  Map<String, dynamic> t209;
  Map<String, dynamic> t30;
  Map<String, dynamic> t308;
  Map<String, dynamic> t312;
  Map<String, dynamic> t329;

  StoreDb() {
    custody = {};
    r47 = {};
    r97 = {};
    t166 = {};
    t209 = {};
    t30 = {};
    t308 = {};
    t312 = {};
    t329 = {};
  }

  @override
  Future<String> getBidItem() async {
    if (currentProject == 0) {
      return "No Project Selected";
    } else {
      DocumentSnapshot snapshot = await getProjects().doc(currentProject).get();
      return snapshot.data()['bidItem'];
    }
  }

  @override
  Future<String> getProjectName() async {
    if (currentProject == 0) {
      return "No Project Selected";
    } else {
      DocumentSnapshot snapshot = await getProjects().doc(currentProject).get();
      return snapshot.data()['projectName'];
    }
  }

  @override
  String getSerialNumber() {
    return currentProject;
  }

    void setProjectFromName(String pName) async{
      projName=pName;
    CollectionReference projects = getProjects();
    QuerySnapshot querySnapshot = await projects.get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    docList.forEach((element) {
      if( element.get('projectName') == pName ){
        currentProject = element.id;
      }
    });
  }

  void setUserFromEmail(String email) async{
    CollectionReference users = getUsers();
    QuerySnapshot querySnapshot = await users.get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    docList.forEach((element) {
      if(element.get('email') == email){
        currentUser = element.id;
      }
    });
  }

  @override
  Future<String> getStatus() async {
    if (currentProject == 0) {
      return "No Project Selected";
    } else {
      DocumentSnapshot snapshot = await getProjects().doc(currentProject).get();
      return snapshot.data()['status'];
    }
  }

  @override
  CollectionReference getProjects() {
    return _firebaseFirestore.collection('ITD-888');
  }

  @override
  CollectionReference getUsers() {
    return _firebaseFirestore.collection('Users');
  }

  Future<void> addNewUser(String firstName, String lastName, String email, String waqtcNumber) async {
    CollectionReference users = getUsers();
    DocumentReference newUser = await users.add(({
      'firstName': firstName,
      'lastName' : lastName,
      'email' : email,
      'waqtcNumber' : waqtcNumber
    }));
    currentUser = newUser.id;
  }

  @override
  Future<Map> getUserInfo() async{
    DocumentSnapshot snapshot = await getUsers().doc(currentUser).get();
    return snapshot.data();
  }



  @override
  void createNewProject(String bidItem, String projectName) async {
    projName=projectName;
    CollectionReference projects = getProjects();

    // add the new project to the db
    DocumentReference newProject = await projects.add({
      'bidItem': bidItem,
      'projectName': projectName,
      'remarks': "",
      'sampleDate': DateTime.now().microsecondsSinceEpoch,
      'Custody': custody,
      'R47': r47,
      'R97': r97,
      'T166': t166,
      'T209': t209,
      'T30': t30,
      'T308': t308,
      'T312': t312,
      'T329': t329
    });

    // set current project to the project that we just added.
    currentProject = newProject.id;
  }

  Future<void> setR47(Map map) async {
    await getProjects().doc(currentProject).update({'R47': map});
  }

  Map getR47() {
    return r47;
  }

  Future<void> setR97(Map map) async {
    await getProjects().doc(currentProject).update({'R97': map});
  }

  Map getR97() {
    return r97;
  }

  Future<void> setT166(Map map) async {
    await getProjects().doc(currentProject).update({'T166': map});
  }

  Map getT166() {
    return t166;
  }

  Future<void> setT209(Map map) async {
    await getProjects().doc(currentProject).update({'T209': map});
  }
  Map getT209() {
    return t209;
  }
  Future<void> setT30(Map map) async {
    await getProjects().doc(currentProject).update({'T30': map});
  }
  Map getT30() {
    return t30;
  }

  Future<void> setT308(Map map) async {
    await getProjects().doc(currentProject).update({'T308': map});
  }

  Map getT308() {
    return t308;
  }

  Future<void> setT312(Map map) async {
    await getProjects().doc(currentProject).update({'T312': map});
  }
  Map getT312() {
    return t312;
  }

  Future<void> setT329(Map map) async {
    await getProjects().doc(currentProject).update({'T329': map});
  }

  Map getT329() {
    return t329;
  }

  Future<void> setCustody(Map map) async {
    await getProjects().doc(currentProject).update({'Custody': map});
  }

  Map getCustody() {
    return custody;
  }

  @override
  void selectProject(String serialNumber) {
    currentProject = serialNumber;
  }

  loadValues() async {
    if (currentProject == 0) {
      return "No Project Selected";
    } else {
      DocumentSnapshot snapshot = await getProjects().doc(currentProject).get();
      this.custody = snapshot.data()['Custody'];
      this.r47 = snapshot.data()['R47'];
      this.r97 = snapshot.data()['R97'];
      this.t166 = snapshot.data()['T166'];
      this.t209 = snapshot.data()['T209'];
      this.t30 = snapshot.data()['T30'];
      this.t308 = snapshot.data()['T308'];
      this.t312 = snapshot.data()['T312'];
      this.t329 = snapshot.data()['T329'];
    }
  }

  @override
  Future<List<String>> listProjects() async {
    List<String> projectSerialNumbers = List<String>();
    CollectionReference projects = getProjects();
    QuerySnapshot querySnapshot = await projects.get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    docList.forEach((element) => projectSerialNumbers.add(element.get('projectName')));
    return projectSerialNumbers;
  }
  void loadMapNames() async {
    CollectionReference projects = getProjects();
    QuerySnapshot querySnapshot = await projects.get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    mapNames={ "": ""};
    docList.forEach((element) => mapNames[element.get('projectName')]= element.id);
    print(mapNames);
  }
  Map<String, dynamic>  getMapNames(){
    return mapNames;
  }
  String getProjName(){
    return projName;
  }
  @override
  Map<String,dynamic > mapNames;

}
