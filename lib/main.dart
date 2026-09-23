import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',
      home: const StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // Student Picture
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                  ),

                  const Icon(
                    Icons.check_circle,
                    size: 30,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Student Name
              const Text(
                'Gone Ruthwika',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Computer Science Student',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              // Student Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    children: [
                      Icon(Icons.badge),
                      SizedBox(height: 5),
                      Text('STU101'),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.school),
                      SizedBox(height: 5),
                      Text('CSE'),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(height: 5),
                      Text('3rd Year'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Contact Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 15),
                        Text('ruthwika@gmail.com'),
                      ],
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 15),
                        Text('9876543210'),
                      ],
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 15),
                        Text('Hyderabad'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}