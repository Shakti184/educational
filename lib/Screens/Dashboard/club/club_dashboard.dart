import 'package:edubridge/Screens/Authentication/club/clubsignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClubDashboard extends StatefulWidget {
  const ClubDashboard({super.key});

  @override
  State<ClubDashboard> createState() => _ClubDashboardState();
}

class _ClubDashboardState extends State<ClubDashboard> {
  @override
  Widget build(BuildContext context) {
    return const DashboardPage();
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromARGB(
                  255, 24, 96, 252),Color.fromARGB(255, 255, 255, 224), Colors.white],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        radius: (25),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/home_page.jpeg"),
                        )),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ', // Replace with student's name
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Kinesis Technical Society', // Replace with student's name
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () => logOut(context),
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                          size: 25,
                        ))
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
                              height: 175,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("Club Id"),
                                    const Text("KIET21"),
                                    const Text("Mail"),
                                    const Text("kts@kiet.edu"),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(Colors.blue),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Profile",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 13),
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
                            height: 175,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Upcoming Event"),
                                CircleAvatar(
                                    radius: (30),
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset("assets/home_page.jpeg"),
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
                  height: 25,
                ),
                Stack(
                  children: [
                    Column(
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
                                  width: 100,
                                  height: 150,
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
                                        const Text("Host"),
                                        const Text("Event"),
                                      ]),
                                )),
                            Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: 100,
                                  height: 150,
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
                                        const Text("Privious"),
                                        const Text("Events"),
                                      ]),
                                )),
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 100,
                                height: 150,
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
                                      const Text("Upcominig"),
                                      const Text("Event"),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: 100,
                                  height: 150,
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
                                        const Text("Permissions"),
                                      ]),
                                )),
                            Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: 100,
                                  height: 150,
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
                                        const Text("Report"),
                                      ]),
                                )),
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 100,
                                height: 150,
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
                                      const Text("Hiring"),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    // ignore: unnecessary_const
                    Card(
                      child: SizedBox(
                        width: 350,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Club Coordinators",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  color: Colors.red,
                                  child: SizedBox(
                                      width: 80,
                                      height: 25,
                                      child: Center(
                                          child: Text(
                                        "Mr.X",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ),
                                Card(
                                  color: Colors.green,
                                  child: SizedBox(
                                      width: 80,
                                      height: 25,
                                      child: Center(
                                          child: Text(
                                        "Mr.Y",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ),
                              ],
                            ),
                          ],
                        ),
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
          backgroundColor: Colors.blue,
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
                        builder: ((context) => const ClubSignInPage())),
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
