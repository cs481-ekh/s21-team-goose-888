import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class fireStoreDb {
  Future<String> serialNumber();

  Future<String> status();

  Future<String> bidItem();

  Future<String> projectName();
}

class db implements fireStoreDb {
  final FirebaseFirestore _firebaseFirestore =  FirebaseFirestore.instance;

  @override
  Future<String> bidItem() {
    // TODO: implement bidItem
    throw UnimplementedError();
  }

  @override
  Future<String> projectName() {
    // TODO: implement projectName
    throw UnimplementedError();
  }

  @override
  Future<String> serialNumber() {
    // TODO: implement serialNumber
    throw UnimplementedError();
  }

  @override
  Future<String> status() {
    // TODO: implement status
    throw UnimplementedError();
  }


}