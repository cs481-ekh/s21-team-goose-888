import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class FireStoreDb {
  // current project will be the id of the selected project
  //this id will be used to reference all other parts of the form.
  var currentProject;

  // First set of methods are methods to get info from the ITD-888 collection
  String getSerialNumber();
  String getStatus();
  String getBidItem();
  String getProjectName();
  void selectProject(String serialNumber);
  CollectionReference getProjects();

  // this method creates a new document in the ITD-888 collection with an
  //auto generated id
  DocumentReference createNewProject(String bidItem, String projectName, String remarks);

}

class StoreDb implements FireStoreDb {
  final FirebaseFirestore _firebaseFirestore =  FirebaseFirestore.instance;
  var currentProject = 0;

  @override
  String getBidItem() {
    if(currentProject == 0){
      return "No Project Selected";
    }else {
      DocumentSnapshot snapshot = getProjects()
          .doc(currentProject)
          .get() as DocumentSnapshot;
      Map<String, dynamic> data = snapshot.data();
      return data['bidItem'];
    }
  }

  @override
  String getProjectName() {
      if(currentProject == 0){
        return "No Project Selected";
      }else {
        DocumentSnapshot snapshot = getProjects()
            .doc(currentProject)
            .get() as DocumentSnapshot;
        Map<String, dynamic> data = snapshot.data();
        return data['projectName'];
      }
  }

  @override
  String getSerialNumber() {
    return currentProject;
  }

  @override
  String getStatus() {
    if(currentProject == 0){
      return "No Project Selected";
    }else {
      DocumentSnapshot snapshot = getProjects()
          .doc(currentProject)
          .get() as DocumentSnapshot;
      Map<String, dynamic> data = snapshot.data();
      return data['status'];
    }
  }

  @override
  CollectionReference getProjects()  {
    return _firebaseFirestore.collection('ITD-888');
  }

  @override
  DocumentReference createNewProject(String bidItem, String projectName, String remarks) {

    CollectionReference projects = getProjects();

    // add the new project to the db
    DocumentReference newProject = projects.add({
      'bidItem': bidItem,
      'projectName': projectName,
      'remarks': remarks,
      'sampleDate': DateTime.now().microsecondsSinceEpoch
    }) as DocumentReference;

    // set current project to the project that we just added.
    currentProject = newProject.id;

    return newProject;
  }

  @override
  void selectProject(String serialNumber) {
    currentProject = serialNumber;
  }

}