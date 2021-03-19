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
  final FirebaseFirestore _firebaseFirestore =  FirebaseFirestore.instance;
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

  StoreDb();

  @override
  Future<String> getBidItem() async {
    if(currentProject == 0){
      return "No Project Selected";
    }else {
      DocumentSnapshot snapshot = await getProjects()
          .doc(currentProject)
          .get() ;
      return snapshot.data()['bidItem'];

    }
  }

  @override
  Future<String> getProjectName() async {
      if(currentProject == 0){
        return "No Project Selected";
      }else {
        DocumentSnapshot snapshot = await getProjects()
            .doc(currentProject)
            .get() ;
        return snapshot.data()['projectName'];
      }
  }

  @override
  String getSerialNumber() {
    return currentProject;
  }

  @override
  Future<String> getStatus() async {
    if(currentProject == 0){
      return "No Project Selected";
    }else {
      DocumentSnapshot snapshot = await getProjects()
          .doc(currentProject)
          .get();
      return snapshot.data()['status'];

    }
  }

  @override
  CollectionReference getProjects() {
    return _firebaseFirestore.collection('ITD-888');
  }

  @override
  void createNewProject(String bidItem, String projectName) async{

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

  @override
  void selectProject(String serialNumber) {
    currentProject = serialNumber;
  }

  @override
  Future<List<String>> listProjects() async {
    List<String> projectSerialNumbers;
    CollectionReference projects = getProjects();
    QuerySnapshot querySnapshot = await projects.get();
    List<QueryDocumentSnapshot> docList = querySnapshot.docs;
    docList.forEach((element) => projectSerialNumbers.add(element.id));
    return projectSerialNumbers;
  }

}