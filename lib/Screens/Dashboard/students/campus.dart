import 'package:edubridge/Screens/Dashboard/students/articles.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_input_field.dart';

class CampusDashboard extends StatefulWidget {
  const CampusDashboard({super.key});

  @override
  State<CampusDashboard> createState() => _CampusDashboardState();
}

class _CampusDashboardState extends State<CampusDashboard> {
  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final TextEditingController _searchEventController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 188, 188),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    decoration: const BoxDecoration(
                      backgroundBlendMode: BlendMode.lighten,
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
                    width: 240,
                  ),
                  CircleAvatar(
                      radius: (22),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/home_page.jpeg"),
                      )),
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
                        const Text(
                          "Explore Campus",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const Text(
                          "Exploration is the key to new doors",
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
                "Current Events",
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
                "Hiring for clubs",
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
                                      const Text("Impeecables"),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                                "assets/home_page.jpeg"),
                                          )),
                                      const Text("KMC"),
                                      const Text("Music Club"),
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
                                  const Text("TEDx"),
                                  const Text("Dance Club"),
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
                                      const Text("Dance Club"),
                                      const Text("Dance Club"),
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
                                      const Text("Ayushman Club"),
                                      const Text("Pharmacy KIET"),
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
                                  const Text("Movie Society"),
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
                "Articles",
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
                                      const Text("Blood Donation"),
                                      const Text("Report"),
                                    ]),
                              )),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ArticlePage(),
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
                                        const Text("CM-Visit"),
                                        const Text("Article"),
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
                                  const Text("Use of Phone"),
                                  const Text("Article"),
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
                                      const Text("Research Paper"),
                                      const Text("Report"),
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
                                      const Text("ICAI Conference"),
                                      const Text("Article"),
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
                                  const Text("Coming Soon"),
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
            ],
          ),
        ),
      ),
    );
  }
}
