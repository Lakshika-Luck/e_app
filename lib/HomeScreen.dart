//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogInScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
    return user;
*/
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xffffffff),
    appBar: AppBar(
      backgroundColor: Color(0xffff2fc3), title: Text("Home"),

      //create logout
      actions: <Widget>[
        FlatButton.icon(
            onPressed: () {
              logOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LogInScreen()));
            },
            icon: Icon(Icons.person),
            label: Text("Log Out"))
      ],
    ),
  );
}

/*
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 170,
              color: Color(0xff000725),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Image(
                    image: AssetImage("images/logo.jpg"),
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentEmail,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Admin CRUD"),
              leading: Icon(Icons.settings),
              /* onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext conext) => AdminScreen()));
              },*/
            ),
            ListTile(
              title: Text("Courses"),
              leading: Icon(Icons.book),
            ),
            ListTile(
              title: Text("Students"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Details"),
              leading: Icon(Icons.question_answer),
            ),
            Divider(),
            ListTile(title: Text("Contact Us"), leading: Icon(Icons.email)),
          ],
        ),
      ),
    );*/
