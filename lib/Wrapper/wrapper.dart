import 'package:edubridge/Screens/Authentication/club/clubsignin.dart';
import 'package:edubridge/Screens/Authentication/mentor/mentorsignin.dart';
import 'package:edubridge/Screens/Authentication/students/studentsignin.dart';
import 'package:edubridge/Screens/Dashboard/mentors/mentor_dashboard.dart';
import 'package:edubridge/Screens/Dashboard/students/homepage_student.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Screens/Authentication/admin/adminsignin.dart';
import '../Screens/Dashboard/admin/admin_dashboard.dart';
import '../Screens/Dashboard/club/club_dashboard.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 188, 188),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final user = snapshot.data;
            if (user == null) {
              // User not logged in, show sign-in options
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Login As",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentSignInPage(),
                                ),
                              ),
                              child: Card(
                                  color: Colors.white,
                                  child: SizedBox(
                                    width: 110,
                                    height: 140,
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
                                          const Text("Student"),
                                        ]),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClubSignInPage(),
                                ),
                              ),
                              child: Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: 110,
                                  height: 140,
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
                                      const Text("Club"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MentorSignInPage(),
                                ),
                              ),
                              child: Card(
                                  color: Colors.white,
                                  child: SizedBox(
                                    width: 110,
                                    height: 140,
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
                                          const Text("Mentor"),
                                        ]),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminSignInPage(),
                                ),
                              ),
                              child: Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: 110,
                                  height: 140,
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
                                      const Text("Admin"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              // User logged in, check if admin
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final Map<String, dynamic>? data =
                        snapshot.data!.data() as Map<String, dynamic>?;
                    print(data);
                    if (data != null && data.containsKey('user')) {
                      final List<bool>? finalData = data['user']?.cast<bool>();

                      if (finalData != null) {
                        if (finalData[0]) {
                          return const AdminDashboard();
                        } else if (finalData[1]) {
                          return const StudentHomePage();
                        } else if (finalData[2]) {
                          return const MentorDashboard();
                        } else if (finalData[3]) {
                          return const ClubDashboard();
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      } else {
                        return const Center(child: Text('Invalid data format'));
                      }
                    } else {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text('Data Not Found'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentSignInPage()),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    }
                  }
                },
              );
            }
          }
        },
      ),
    );
  }
}
