import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> addStudent(
  String Name,
  String Email,
  String Course,
  BuildContext context,
) async {
  await FirebaseFirestore.instance.collection("students").add({
    "NAME": Name,
    "EMAIL": Email,
    "COURSE": Course,
  });
 
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text("Student Created successfuly")));
}
Stream<QuerySnapshot>getstudents(){
  return FirebaseFirestore.instance.collection("students").snapshots();
}
Future<void>deletestudent(
  String id,BuildContext context,
)async{
  await FirebaseFirestore.instance.collection("students").doc(id).delete();
  ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text("Deleted Successfully")));
}
Future<void>updatestudent(
  String id,Name,Email,Course,BuildContext context,
)async{
  await FirebaseFirestore.instance.collection("students").doc(id).update({
    "NAME": Name,
    "EMAIL": Email,
    "COURSE": Course,
  });
}