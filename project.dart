import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProjectPage(),
    );
  }
}

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjusting the number of cards shown based on screen size
    int crossAxisCount = 1; // Default to 1 for mobile
    if (screenWidth > 1200) {
      crossAxisCount = 3; // Desktop screens
    } else if (screenWidth > 800) {
      crossAxisCount = 2; // Tablet screens
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Projects',
              style: TextStyle(
                color: Colors.redAccent,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _navButton(context, 'Home', '/'),
                    _navButton(context, 'About me', '/personal_info'),
                    _navButton(context, 'Skills', '/skills'),
                    _navButton(context, 'Qualification', '/experience'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disables internal grid scroll
                children: const [
                  ProjectCard(
                    title: 'School Management System',
                    date: 'Jan 2021',
                    details: 'Tool: PHP & MySQL',
                    imagePath: 'assets/images/school.jpeg',
                  ),
                  ProjectCard(
                    title: 'Online Course Management System',
                    date: 'Aug 2021',
                    details: 'Tool: PHP & MySQL',
                    imagePath: 'assets/images/online.png',
                  ),
                  ProjectCard(
                    title: 'Python Compiler',
                    date: 'March 2023',
                    details: 'Tool: Pycharm',
                    imagePath: 'assets/images/python.jpeg',
                  ),
                  ProjectCard(
                    title: 'Personal Portfolio',
                    date: 'Dec 2023',
                    details: 'Languages: HTML, CSS, JS',
                    imagePath: 'assets/images/portfolio.png',
                  ),
                  ProjectCard(
                    title: 'E-Food Court',
                    date: 'July 2024',
                    details: 'Languages: HTML, CSS, JS',
                    imagePath: 'assets/images/food.jpeg',
                  ),
                  ProjectCard(
                    title: 'Govt. Tax Website System',
                    date: 'Nov 2020',
                    details: 'Tools: Oracle',
                    imagePath: 'assets/images/tax.jpeg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Navbar Button Helper Function
  Widget _navButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.orangeAccent),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String date;
  final String details;
  final String imagePath;

  const ProjectCard({
    super.key,
    required this.title,
    required this.date,
    required this.details,
    required this.imagePath,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust sizes based on screen width
    double imageSize =
        screenWidth < 600 ? 120 : 200; // Smaller image for mobile
    double fontSize =
        screenWidth < 600 ? 16 : 20; // Smaller text size for mobile
    double buttonFontSize =
        screenWidth < 600 ? 14 : 16; // Adjust button text size

    return GestureDetector(
      onTap: () => setState(
          () => _isHovered = !_isHovered), // Tap to simulate hover on mobile
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Card(
          color: _isHovered
              ? Colors.grey[300]
              : Colors.white, // Change card color on hover/tap
          child: Padding(
            padding: screenWidth < 600
                ? const EdgeInsets.all(10.0) // Less padding for mobile
                : const EdgeInsets.all(15.0), // More padding for desktop/tablet
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Allow card to be as small as possible
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagePath,
                  height: imageSize, // Dynamic image size
                  width: imageSize, // Dynamic image size
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize, // Dynamic text size
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.date,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 4), // Add some space before details
                Text(
                  widget.details,
                  style: const TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to project code
                      },
                      child: Text(
                        'Source Code',
                        style: TextStyle(
                            fontSize:
                                buttonFontSize), // Dynamic button text size
                      ),
                    ),
                    const SizedBox(height: 8), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to live project
                      },
                      child: Text(
                        'Live Project',
                        style: TextStyle(
                            fontSize:
                                buttonFontSize), // Dynamic button text size
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
