import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_directory_app/service.dart';

class StdDirectory extends StatefulWidget {
  const StdDirectory({super.key});

  @override
  State<StdDirectory> createState() => _StdDirectoryState();
}

class _StdDirectoryState extends State<StdDirectory> {
  TextEditingController Namec = TextEditingController();
  TextEditingController Emailc = TextEditingController();
  TextEditingController Coursec = TextEditingController();
  void editbox(DocumentSnapshot doc) {
    Namec.text = doc["NAME"];
    Emailc.text = doc["EMAIL"];
    Coursec.text = doc["COURSE"];
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        children: [
          Text("Edit Student",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 20,),
          TextField(
            controller: Namec,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.amber,
              hintText: "Name",
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: Emailc,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.amber,
              hintText: "Email",
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: Coursec,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.amber,
              hintText: "Course",
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: () {
              updatestudent(
                doc.id,
                Namec.text,
                Emailc.text,
                Coursec.text,
                context,
              );
            },
            child: Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          "Student Directory",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Add Student Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: Namec,
                      decoration: InputDecoration(
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Name",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: Emailc,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: Coursec,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Course",
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        addStudent(
                          Namec.text,
                          Emailc.text,
                          Coursec.text,
                          context,
                        );
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: getstudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]["NAME"]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index]["EMAIL"]),
                    Text(data[index]["COURSE"]),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        deletestudent(data[index].id, context);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {
                        editbox(data[index]);
                      },
                      icon: Icon(Icons.edit, color: Colors.blue),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
