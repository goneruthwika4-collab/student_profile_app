import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Profile"),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          // Breakpoint
          bool isTablet = constraints.maxWidth >= 600;

          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: isTablet ? width * 0.70 : width * 0.90,
                padding: EdgeInsets.all(isTablet ? 35 : 20),
                margin: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  children: [

                    // Profile Image
                    CircleAvatar(
                      radius: isTablet ? 90 : 60,
                      backgroundImage: const NetworkImage(
                        "https://randomuser.me/api/portraits/women/32.jpg",
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Name
                    Text(
                      "Ananya Sharma",
                      style: TextStyle(
                        fontSize: isTablet ? 30 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Computer Science Student",
                      style: TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 25),

                    // Details
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Icon(Icons.badge, size: 30),
                              SizedBox(height: 5),
                              Text("STU101"),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: const [
                              Icon(Icons.school, size: 30),
                              SizedBox(height: 5),
                              Text("CSE"),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: const [
                              Icon(Icons.location_on, size: 30),
                              SizedBox(height: 5),
                              Text("Hyderabad"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // MediaQuery Output
                    Text(
                      "Screen Width: ${width.toInt()}",
                      style: const TextStyle(fontSize: 16),
                    ),

                    Text(
                      "Screen Height: ${height.toInt()}",
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      isTablet ? "Tablet Layout" : "Mobile Layout",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("View Profile"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}