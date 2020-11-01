import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String studentName, studentIndex, studentCourse;
  double studentGPA;
  getStudentName(name) {
    this.studentName = name;
  }

  getStudentIndex(index) {
    this.studentIndex = index;
  }

  getStudentCourse(course) {
    this.studentCourse = course;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    //create map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentIndex": studentIndex,
      "studentCourse": studentCourse,
      "studentGPA": studentGPA
    };

    //send mapping to doceumnt reference
    documentReference.setData(students).whenComplete(() {
      print("$studentName created");
    });
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["studentName"]);
      print(datasnapshot.data["studentIndex"]);
      print(datasnapshot.data["studentCourse"]);
      print(datasnapshot.data["studentGPA"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    //create map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentIndex": studentIndex,
      "studentCourse": studentCourse,
      "studentGPA": studentGPA
    };

    //send mapping to doceumnt reference
    documentReference.setData(students).whenComplete(() {
      print("$studentName updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);
    documentReference.delete().whenComplete(() {
      print("$studentName Removed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("E College Enrollment"),
        ),
        body: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) {
                  getStudentName(name);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Student Index",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String index) {
                  getStudentIndex(index);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Course",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String course) {
                  getStudentCourse(course);
                },
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "GPA",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String gpa) {
                getStudentGPA(gpa);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new SizedBox(
                      width: 60,
                      height: 30,
                      child: RaisedButton(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text("Add"),
                        textColor: Colors.white,
                        onPressed: () {
                          createData();
                        },
                      ),
                    ),
                    new SizedBox(
                      width: 76,
                      height: 30,
                      child: RaisedButton(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text("Details"),
                        textColor: Colors.white,
                        onPressed: () {
                          readData();
                        },
                      ),
                    ),
                    new SizedBox(
                      width: 78,
                      height: 30,
                      child: RaisedButton(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text("Update"),
                        textColor: Colors.white,
                        onPressed: () {
                          updateData();
                        },
                      ),
                    ),
                    new SizedBox(
                        width: 83,
                        height: 30,
                        child: RaisedButton(
                          color: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Text("Remove"),
                          textColor: Colors.white,
                          onPressed: () {
                            deleteData();
                          },
                        )),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 1, right: 1),
              child: Row(
                //textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: Text("Name"),
                  ),
                  Expanded(
                    child: Text("Index"),
                  ),
                  Expanded(
                    child: Text("Course"),
                  ),
                  Expanded(
                    child: Text("GPA"),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 62.0),
            child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 1, right: 5),
                child: StreamBuilder(
                    stream:
                        Firestore.instance.collection("MyStudents").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.documents[index];
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    child:
                                        Text(documentSnapshot["studentName"]),
                                  ),
                                  Expanded(
                                    child:
                                        Text(documentSnapshot["studentIndex"]),
                                  ),
                                  Expanded(
                                    child:
                                        Text(documentSnapshot["studentCourse"]),
                                  ),
                                  Expanded(
                                    child: Text(documentSnapshot["studentGPA"]
                                        .toString()),
                                  )
                                ],
                              );
                            });
                      } else {
                        return Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ),
        ]));
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000725),
      appBar: AppBar(
        backgroundColor: Color(0xffff2fc3),
        title: Text("Student Enrollments",style: TextStyle(color: Color(0xffffffff)),),
      ),
      body: Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

        ],
      ),
    );
  }*/

/*
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blueAccent,
          accentColor: Colors.grey),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
*/
//class _MyAppState extends State<MyApp>
