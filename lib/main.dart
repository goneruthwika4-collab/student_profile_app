import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Profile',

      routes: {
        '/details': (context) => const StudentDetailsPage(),
      },

      home: const StudentProfilePage(),
    );
  }
}

// --------------------------------------------------
// STUDENT PROFILE PAGE
// --------------------------------------------------

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() =>
      _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {

  // Student information
  String studentName = 'Gone Ruthwika';
  String course = 'Computer Science Student';
  String department = 'CSE';

  // State variable
  bool isUpdated = false;

  // Update / Restore profile
  void updateProfile() {
    setState(() {
      if (isUpdated) {
        // Normal profile
        studentName = 'Gone Ruthwika';
        course = 'Computer Science Student';
        department = 'CSE';
        isUpdated = false;
      } else {
        // Updated profile
        studentName = 'Ruthwika';
        course = 'Senior Computer Science Student';
        department = 'Computer Science';
        isUpdated = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              children: [

                // Profile Picture
                const CircleAvatar(
                  radius: 70,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),

                const SizedBox(height: 20),

                // Student Name
                Text(
                  studentName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Course
                Text(
                  course,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),

                // Student ID
                const Row(
                  children: [
                    Icon(Icons.badge),
                    SizedBox(width: 15),
                    Text(
                      'Student ID: STU101',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Email
                const Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 15),
                    Text(
                      'Email: ruthwika@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Phone
                const Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 15),
                    Text(
                      'Phone: 9876543210',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Department
                Row(
                  children: [
                    const Icon(Icons.school),
                    const SizedBox(width: 15),
                    Text(
                      'Department: $department',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Update / Restore Button
                ElevatedButton.icon(
                  onPressed: updateProfile,
                  icon: Icon(
                    isUpdated ? Icons.restore : Icons.edit,
                  ),
                  label: Text(
                    isUpdated
                        ? 'Restore Profile'
                        : 'Update Profile',
                  ),
                ),

                const SizedBox(height: 15),

                // View Details
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentDetailsPage(
                          name: studentName,
                          course: course,
                          department: department,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('View Details'),
                ),

                const SizedBox(height: 15),

                // Named Route
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open Named Route'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// STUDENT DETAILS PAGE
// --------------------------------------------------

class StudentDetailsPage extends StatelessWidget {
  final String name;
  final String course;
  final String department;

  const StudentDetailsPage({
    super.key,
    this.name = 'Ananya Sharma',
    this.course = 'Computer Science Student',
    this.department = 'CSE',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              children: [

                const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Student Details',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  'Name: $name',
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Student ID: STU101',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 12),

                Text(
                  'Department: $department',
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 12),

                Text(
                  'Course: $course',
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Email: student@gmail.com',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Phone: 9876543210',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 30),

                // Back Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}