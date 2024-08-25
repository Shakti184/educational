
  import 'package:flutter/material.dart';
 

 Widget buildClubCard(String imagePath, String title, String department) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: 110,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imagePath),
              ),
            ),
            Text(title),
            Text(
              department,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
            Container(
              width: 80,
              height: 18,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 103, 243),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "Apply Now",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
