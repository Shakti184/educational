import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edubridge/Screens/Dashboard/students/homepage_student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_input_field.dart';
import '../forgetpassword.dart';
import 'studentsignup.dart';

class StudentSignInPage extends StatefulWidget {
  const StudentSignInPage({super.key});

  @override
  State<StudentSignInPage> createState() => _StudentSignInPageState();
}

class _StudentSignInPageState extends State<StudentSignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 185, 255),
      appBar: AppBar(
          title: const Center(
        child: Text(
          'EduBridge',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 97, 96, 96)),
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  'assets/home_page.jpeg',
                  height: 200.0,
                  width: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Student Sign In',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  RoundedInputField(
                    labelText: 'Email',
                    obscureText: false,
                    borderRadius: 40.0,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16.0),
                  RoundedInputField(
                    labelText: 'Password',
                    obscureText: !_showPassword,
                    borderRadius: 40.0,
                    controller: _passwordController,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _performLogin,
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      fixedSize: const Size(180, 50),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: _navigateToUserSignIn,
                    // child: const Text('Create New Admin Account'),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: 'Create New User Account \n'),
                          TextSpan(
                            text: 'Register Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToUserSignIn() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (contrxt) => const StudentSignUpPage()),
        (route) => false);
  }

  void _performLogin() async {
    // try {
    //   final String email = _emailController.text.trim();
    //   final String password = _passwordController.text.trim();

    //   final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );

    //   final User? user = userCredential.user;

    //   if (user != null) {
    //     // final DocumentSnapshot userDetailsSnapshot = await FirebaseFirestore.instance
    //     //     .collection('users')
    //     //     .doc(user.uid)
    //     //     .get();

    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const StudentDashboard(),
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   if (mounted) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: const Text('Authentication Failed'),
    //         content: Text(e.toString()),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: const Text('OK'),
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    // }
    setState(() {
      _isLoading = true; // Set loading state to true
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Check if the signed-in user is an admin
      String? userEmail = userCredential.user?.email;
      if (userEmail != null && await _isStudent(userEmail)) {
        // Navigate to the admin home page
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const StudentHomePage()),
            (route) => false);
      } else {
        // Not an admin, show error message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'You are not authorized to access the admin panel.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Show error message if sign-in fails
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to sign in: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false; // Set loading state to false
      });
    }
  }

  Future<bool> _isStudent(String email) async {
    try {
      // Query Firestore to check if the user is an admin
      final adminSnapshot = await FirebaseFirestore.instance
          .collection('students')
          .where('email', isEqualTo: email)
          .get();

      // If the query returns any documents, it means the user is an admin
      return adminSnapshot.docs.isNotEmpty;
    } catch (e) {
      // Handle any errors that occur during the query
      print('Error checking admin status: $e');
      return false;
    }
  }
}
