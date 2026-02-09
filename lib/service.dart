import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> addStudent(String Name,String Email,String Course,BuildContext context)async {
  await FirebaseFirestore.instance.collection("students").add({"NAME":Name,"EMAIL":Email,"COURSE":Course});
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Student Created successfuly")));
}