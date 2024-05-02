import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../components/rounded_input_field.dart';
import '../forgetpassword.dart';
import 'studentsignin.dart';


class StudentSignUpPage extends StatefulWidget {
  const StudentSignUpPage({Key? key}) : super(key: key);

  @override
  State<StudentSignUpPage> createState() => _StudentSignUpPageState();
}

class _StudentSignUpPageState extends State<StudentSignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  bool _showPassword = false;

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
                    'Student Registration',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  RoundedInputField(
                    labelText: 'Username',
                    obscureText: false,
                    borderRadius: 40.0,
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 16.0),
                  RoundedInputField(
                    labelText: 'Email',
                    obscureText: false,
                    borderRadius: 40.0,
                    controller: _userEmailController,
                  ),
                  const SizedBox(height: 16.0),
                  RoundedInputField(
                    labelText: 'Password',
                    obscureText: !_showPassword,
                    borderRadius: 40.0,
                    controller: _passwordController,
                    suffixIcon: IconButton(
                      icon: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
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
                        child: const Text('Forgot Password?',style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _performSignUp,
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          fixedSize: const Size(180, 50),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (contrxt) => const StudentSignInPage()),
                          (route) => false);
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 // Import PlatformException
void _performSignUp() async {
  final String username = _usernameController.text.trim();
  final String password = _passwordController.text.trim();
  final String email = _userEmailController.text.trim();

  if (username.isEmpty || password.isEmpty || email.isEmpty) {
    _showErrorDialog("Enter The Required Fields");
    return;
  }

  try {
    // Check if the email is already in use
    bool emailInUse = await _isEmailInUse(email);
    if (emailInUse) {
      // Email is already in use, show warning dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('The email address is already in use by another account.'),
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
      return;
    }

    // Email is not in use, proceed with user creation
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update user's display name
    await userCredential.user?.updateDisplayName(username);
    await FirebaseFirestore.instance
        .collection('students')
        .doc(userCredential.user!.uid)
        .set({
      'username': username,
      'email': email,
      
      // Add other user data fields if needed
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
          'user': [false,true,false,false]//[admin,student,club,mentor] 
      // Add other user data fields if needed
    });

    // Show snackbar to indicate successful sign-up
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully. Please log in.'),
        duration: Duration(seconds: 3), // Adjust duration as needed
      ),
    );

    // Navigate to SignInPage after successful sign-up
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const StudentSignInPage()),
    );
  } catch (e) {
    // Show error dialog for any other errors
    _showErrorDialog(e.toString());
  }
}

Future<bool> _isEmailInUse(String email) async {
 try {
    // Query Firestore to check if the email already exists in the 'users' collection
    var querySnapshot = await FirebaseFirestore.instance
        .collection('students')
        .where('email', isEqualTo: email)
        .get();
      print(querySnapshot.docs);
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    // Handle any potential errors
    print('Error checking if email is in use: $e');
    return true; // Assume email is in use to be safe
  }
}


    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign Up Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
}
