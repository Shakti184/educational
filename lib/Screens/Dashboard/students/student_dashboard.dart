import 'package:edubridge/Screens/Authentication/students/studentsignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  final String userName;
  const StudentDashboard({
    super.key,
    required this.userName,
  });

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                      width:40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: (30),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/home_page.jpeg"),
                        )),
                    Text(
                      'Welcome, ${widget.userName}', // Replace with student's name
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () => logOut(context),
                      icon: const Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                            color: Colors.white,
                            child: SizedBox(
                              width: 150,
                              height: 180,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("Library Id"),
                                    const Text("2024cs1156"),
                                    const Text("Mobile Number"),
                                    const Text("9090898988"),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.blue),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Profile",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        )),
                                  ]),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Card(
                          color: Colors.white,
                          child: SizedBox(
                            width: 150,
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Upcoming Event"),
                                CircleAvatar(
                                    radius: (30),
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child:
                                          Image.asset("assets/home_page.jpeg"),
                                    )),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.blue),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Innotech-2023",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Card(
                            color: Colors.white,
                            child: SizedBox(
                              width: 90,
                              height: 130,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                        radius: (30),
                                        backgroundColor: Colors.white,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("Event"),
                                  ]),
                            )),
                        Card(
                            color: Colors.white,
                            child: SizedBox(
                              width: 90,
                              height: 130,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                        radius: (30),
                                        backgroundColor: Colors.white,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("Club Data"),
                                  ]),
                            )),
                        Card(
                          color: Colors.white,
                          child: SizedBox(
                            width: 90,
                            height: 130,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                      radius: (30),
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            "assets/home_page.jpeg"),
                                      )),
                                  const Text("Mentors"),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Latest Hirings",
                  style: TextStyle(fontSize: 20),
                ),
                const Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: Colors.white,
                            title: Text('Event 1'),
                            subtitle: Text('Details of Event 1'),
                          ),
                          SizedBox(height: 5),
                          ListTile(
                            tileColor: Colors.white,
                            title: Text('Event 2'),
                            subtitle: Text('Details of Event 2'),
                          ),
                          // Add more events as needed
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logOut(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20,
          backgroundColor: Colors.redAccent,
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You will be redirected to login page.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                _signOut(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const StudentSignInPage())),
                    (route) => false); // Navigate to login
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }
}
