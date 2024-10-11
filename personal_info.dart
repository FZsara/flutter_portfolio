import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '< FZ />',
              style: TextStyle(
                color: Colors.redAccent,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _navButton(context, 'Home', '/'),
                    _navButton(context, 'Skills', '/skills'),
                    _navButton(context, 'Projects', '/projects'),
                    _navButton(context, 'Qualification', '/experience'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: screenSize.width > 600 ? 180 : 120,
                    height: screenSize.width > 600 ? 120 : 80,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly rounded corners
                      image: const DecorationImage(
                        image: AssetImage('assets/images/fz.jpg'),
                        fit: BoxFit
                            .contain, // Maintain original aspect ratio without cutting
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'FARIHA ZANNAT',
                    style: TextStyle(
                      fontSize: screenSize.width > 600 ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Contact Me',
                    style: TextStyle(
                      fontSize: screenSize.width > 600 ? 24 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Contact Information
            _contactInfo(Icons.phone, '01317664535'),
            _contactInfo(Icons.email, 'zannatfariha186@gmail.com'),
            _contactInfo(Icons.location_on, 'Agrabad, CDA R/A, Chattogram'),
            const Divider(height: 30, color: Colors.orangeAccent),

            // Education Section
            _sectionTitle('Courses Enrolled', screenSize.width > 600 ? 24 : 18),
            _educationItem('Programming Hero', 'Web Development', '2023 - 2024'),
            _educationItem('Phitron', 'C/C++', '2020- 2023'),
            _educationItem('Phitron', 'Data Structure', '2020- 2023'),
            _educationItem('Phitron', 'Algorithm', '2020- 2023'),
            _educationItem('Edge Training', 'Mobile App Development', '2024- present'),
            const Divider(height: 30, color: Colors.orangeAccent),

            // Thesis Section
            _sectionTitle('Thesis', screenSize.width > 600 ? 24 : 18),
            _educationItem(
                'Digital Image Processing', 'Ongoing', 'Dec 2024 - May 2025'),
            const Divider(height: 30, color: Colors.orangeAccent),

            // Languages Section
            _sectionTitle('Languages', screenSize.width > 600 ? 24 : 18),
            _languageItem('Bangla'),
            _languageItem('English'),
            const Divider(height: 30, color: Colors.orangeAccent),

            // Skills Section
            _sectionTitle('Personal Skills', screenSize.width > 600 ? 24 : 18),
            _skillItem('Teaching Skills'),
            _skillItem('Critical Thinking'),
            _skillItem('Communication Skills'),
            _skillItem('Leadership'),
            _skillItem('Social Media Management'),
          ],
        ),
      ),
    );
  }

  // Navigation Bar Button
  Widget _navButton(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: const TextStyle(color: Colors.orangeAccent, fontSize: 16),
      ),
    );
  }

  // Reusable Section Title Widget
  Widget _sectionTitle(String title, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }

  // Reusable Contact Info Row Widget
  Widget _contactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Reusable Education Item Widget
  Widget _educationItem(String institution, String degree, String year) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              institution,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  degree,
                  style:
                      const TextStyle(fontSize: 16, color: Colors.orangeAccent),
                ),
                Text(
                  year,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Language Item Widget
  Widget _languageItem(String language) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        language,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  // Reusable Skill Item Widget
  Widget _skillItem(String skill) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        skill,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
