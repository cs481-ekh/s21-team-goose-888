import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class FireStoreDb {
  // current project will be the id of the selected project
  //this id will be used to reference all other parts of the form.
  var currentProject;

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

  // First set of methods are methods to get info from the ITD-888 collection
  String getSerialNumber();
  Future<String> getStatus();
  Future<String> getBidItem();
  Future<String> getProjectName();
  void selectProject(String serialNumber);
  CollectionReference getProjects();
  Future<List> listProjects();

  // this method creates a new document in the ITD-888 collection with an
  //auto generated id
  void createNewProject(String bidItem, String projectName);
}

class StoreDb implements FireStoreDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var currentProject = 0;
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

  StoreDb(){
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
    CollectionReference projects = getProjects();
    QuerySnapshot querySnapshot = await projects.get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    docList.forEach((element) {
      if( element.get('projectName') == pName ){
        currentProject = element.id;
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
  void createNewProject(String bidItem, String projectName) async {
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

  Future<void> setT30(Map map) async {
    await getProjects().doc(currentProject).update({'T30': map});
  }

  Future<void> setT308(Map map) async {
    await getProjects().doc(currentProject).update({'T308': map});
  }

  Future<void> setT312(Map map) async {
    await getProjects().doc(currentProject).update({'T312': map});
  }

  Future<void> setT329(Map map) async {
    await getProjects().doc(currentProject).update({'T329': map});
  }
  Future<void> setCustody(Map map) async {
    await getProjects().doc(currentProject).update({'Custody': map});
  }

  @override
  void selectProject(String serialNumber) {
    currentProject = serialNumber;
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
}
