import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

// Main application with theme
class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile App',

      // Applying ThemeData
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F3FA),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 14,
            ),
          ),
        ),
      ),

      home: const HomePage(),
    );
  }
}

// Custom reusable Student Card
class StudentCard extends StatelessWidget {
  final String name;
  final String rollNo;
  final String department;
  final String year;

  const StudentCard({
    super.key,
    required this.name,
    required this.rollNo,
    required this.department,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                size: 55,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),

            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 15),
            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.badge,
                color: Colors.deepPurple,
              ),
              title: const Text('Roll Number'),
              subtitle: Text(rollNo),
            ),

            ListTile(
              leading: const Icon(
                Icons.school,
                color: Colors.deepPurple,
              ),
              title: const Text('Department'),
              subtitle: Text(department),
            ),

            ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.deepPurple,
              ),
              title: const Text('Academic Year'),
              subtitle: Text(year),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom reusable Button Widget
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.check_circle),
      label: Text(buttonText),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),

            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const StudentCard(
              name: 'Ruthwika G',
              rollNo: '24AG1A0582',
              department: 'Computer Science Engineering',
              year: '3rd Year',
            ),

            const SizedBox(height: 10),

            CustomButton(
              buttonText: 'View Profile',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Student profile displayed successfully!',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}