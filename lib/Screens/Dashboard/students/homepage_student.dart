import 'package:edubridge/Screens/Dashboard/students/campus.dart';
import 'package:edubridge/Screens/Dashboard/students/communities.dart';
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
      
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            
        gradient: LinearGradient(
          colors: [Color.fromARGB(
                    255, 24, 96, 252),Color.fromARGB(255, 255, 255, 224), Color.fromARGB(255, 209, 232, 247)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
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
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 0, 0, 79), Color.fromARGB(255, 84, 84, 254)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(
                                children: [
                                  Text(
                                    "EDU",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        color: Colors.white),
                                  ),
                                  Text(
                                "BRIDGE", // Your text here
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 17, // Font size
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Colors.white, // Underline color
                                  decorationThickness: 0.5,
                                  // fontWeight: FontWeight.normal, // Font weight
                                ),
                                textAlign:
                                    TextAlign.center, // Center align the text
                              ),
                                ],
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
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CommunitiesDashBoard(),
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
                                        ClipRRect(
                                          
                                          child: Image.asset(
                                              "assets/Saly13.png"),
                                        ),
                                        const Text("Communities"),
                                      ]),
                                )),
                          ),
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
                                        ClipRRect(
                                          child: Image.asset(
                                              "assets/image 23.png"),
                                        ),
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
                                  ClipRRect(
                                    child: Image.asset(
                                        "assets/Saly10.png"),
                                  ),
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
                                      ClipRRect(
                                       child: Image.asset(
                                            "assets/Saly1.png"),
                                      ),
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
                                        ClipRRect(
                                          child: Image.asset(
                                              "assets/Dashboard.png"),
                                        ),
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
                "  Communities",
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
                                                "assets/Oval.png"),
                                          )),
                                      const Text("KTS"),
                                      const Text("CS Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                                "assets/Oval (1).png"),
                                          )),
                                      const Text("GDSC KIET"),
                                      const Text("CSE Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                            "assets/Oval (2).png"),
                                      )),
                                  const Text("DSTL"),
                                  const Text("CSE Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                  const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                                "assets/Oval (3).png"),
                                          )),
                                      const Text("NSCC KIET"),
                                      const Text("CS Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                                "assets/Oval (4).png"),
                                          )),
                                      const Text("DevUp"),
                                      const Text("CSIT Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                            "assets/Oval (5).png"),
                                      )),
                                  const Text("Innogeeks"),
                                  const Text("IT Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                  const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                "  Events",
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
                                                "assets/Oval (1).png"),
                                          )),
                                      const Text("GDSE Event"),
                                      const Text("Delhi-NCR",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                            
                                            child: Image.asset(
                                                "assets/Oval (5).png"),
                                          )),
                                      const Text("Innogeeks Hiring"),
                                      const Text("KIET",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                            "assets/Oval.png"),
                                      )),
                                  const Text("KTS Workshop"),
                                  const Text("CS Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                  const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                                "assets/Oval (6).png"),
                                          )),
                                      const Text("UI/UX Design"),
                                      const Text("EEE Department",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                      const Text("Ambuvians",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                            "assets/Oval (7).png"),
                                      )),
                                  const Text("Poster Making"),
                                  const Text("KIET",style: TextStyle(color: Colors.red,fontSize: 12),),
                                  const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                "  Mentors",
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
                                                "assets/Oval (8).png"),
                                          )),
                                      const Text("Kapil Singh"),
                                      const Text("UI/UX Expert",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                                "assets/Oval (9).png"),
                                          )),
                                      const Text("Ishu Tyagi"),
                                      const Text("YouTube Teacher",style: TextStyle(color: Colors.red,fontSize: 12),),
                                      const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                                            "assets/Oval (10).png"),
                                      )),
                                  const Text("Ram"),
                                  const Text("Web Developer",style: TextStyle(color: Colors.red,fontSize: 12),),
                                  const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
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
                height: 40,
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
