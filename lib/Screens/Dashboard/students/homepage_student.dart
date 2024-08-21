import 'package:edubridge/Screens/Dashboard/students/campus.dart';
import 'package:edubridge/Screens/Dashboard/students/student_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_input_field.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _searchEventController = TextEditingController();

  late String _userName = ''; 
  late String _libId ='';
  late String _number='';


@override
  void initState() {
  super.initState();
  _fetchUserData(context);
}
  Future<void> _fetchUserData(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userName = user.displayName ?? ''; // Assign user's name if available
        _libId=user.uid;
        _number=user.phoneNumber??'';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.white],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                        radius: (20),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/home_page.jpeg"),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 0, 80, 146),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "EDUBRIDGE",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                           Text(
                            "Hello, $_userName!",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          const Text(
                            "Hope you feel amazing!!",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RoundedInputField(
                              preicon: const Icon(Icons.search_rounded),
                              suficon: const Icon(Icons.mic),
                              labelText: ' Search ',
                              height: 5,
                              obscureText: false,
                              borderRadius: 10.0,
                              controller: _searchEventController,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
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
                                        const Text("Communities"),
                                      ]),
                                )),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CampusDashboard(),
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
                                          const Text("Campus"),
                                        ]),
                                  )),
                            ),
                            Card(
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
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("Mentors"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
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
                                        const Text("Hiring"),
                                      ]),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentDashboard(userName:_userName),
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
                                          const Text("Dashboard"),
                                        ]),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Communities",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
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
                                        const Text("KTS"),
                                        const Text("CS Department"),
                                      ]),
                                )),
                            Card(
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
                                        const Text("GDSC KIET"),
                                        const Text("CSE Department"),
                                      ]),
                                )),
                            Card(
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
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("DSTL"),
                                    const Text("CSE Department"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
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
                                        const Text("NSCC KIET"),
                                        const Text("CS Department"),
                                      ]),
                                )),
                            Card(
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
                                        const Text("DevUp"),
                                        const Text("CSIT Department"),
                                      ]),
                                )),
                            Card(
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
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("Innogeeks"),
                                    const Text("IT Department"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
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
                                        const Text("GDSE Event"),
                                        const Text("Delhi-NCR"),
                                      ]),
                                )),
                            Card(
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
                                        const Text("Innogeeks Hiring"),
                                        const Text("KIET"),
                                      ]),
                                )),
                            Card(
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
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("KTS Workshop"),
                                    const Text("CS Department"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
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
                                        const Text("UI/UX Design"),
                                        const Text("EEE Department"),
                                      ]),
                                )),
                            Card(
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
                                        const Text("Azure Workshop"),
                                        const Text("Ambuvians"),
                                      ]),
                                )),
                            Card(
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
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("Poster Making"),
                                    const Text("KIET"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Mentors",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
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
                                        const Text("Kapil Singh"),
                                        const Text("UI/UX Expert"),
                                      ]),
                                )),
                            Card(
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
                                        const Text("Ishu Tyagi"),
                                        const Text("YouTube Teacher"),
                                      ]),
                                )),
                            Card(
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
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/home_page.jpeg"),
                                        )),
                                    const Text("Ram"),
                                    const Text("Web Developer"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}
