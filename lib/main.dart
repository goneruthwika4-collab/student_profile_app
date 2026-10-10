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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool expanded = false;
  bool visible = true;
  bool moved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile Animations'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              'My Student Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            // Fade Animation
            AnimatedOpacity(
              opacity: visible ? 1.0 : 0.1,
              duration: const Duration(seconds: 1),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ruthwika G',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Computer Science Engineering'),
                ],
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: const Text('Fade In / Fade Out'),
            ),

            const Divider(height: 35),

            // AnimatedContainer
            const Text(
              'Animated Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: expanded ? 200 : 110,
              height: expanded ? 110 : 80,
              decoration: BoxDecoration(
                color: expanded ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(
                  expanded ? 30 : 10,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Student',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: const Text('Change Size and Color'),
            ),

            const Divider(height: 35),

            // Slide Animation
            const Text(
              'Slide Animation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 100,
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxLeft = constraints.maxWidth - 80;

                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        left: moved ? maxLeft : 0,
                        top: 5,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.school,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  moved = !moved;
                });
              },
              child: const Text('Slide Left / Right'),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}