import 'package:flutter/material.dart';

class StdDirectory extends StatefulWidget {
  const StdDirectory({super.key});

  @override
  State<StdDirectory> createState() => _StdDirectoryState();
}

class _StdDirectoryState extends State<StdDirectory> {
  TextEditingController Namec=TextEditingController();
  TextEditingController Emailc=TextEditingController();
  TextEditingController Coursec=TextEditingController();
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
                content: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: Namec,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Name",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(controller: Emailc,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(controller: Coursec,
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
                      onPressed: () {},
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
    );
  }
}
