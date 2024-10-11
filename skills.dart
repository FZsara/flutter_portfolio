import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

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
              'Skills',
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
                    _navButton(context, 'About me', '/personal_info'),
                    _navButton(context, 'Projects', '/projects'),
                    _navButton(context, 'Qualification', '/experience'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            // Centering the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Technical Skills',
                  style: TextStyle(
                    fontSize: screenSize.width > 600 ? 32 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildSkillRow('Tools', [
                  'assets/icons/flutter.png',
                  'assets/icons/ms.jpeg',
                  'assets/icons/figma.jpeg',
                  'assets/icons/tailwind.png',
                ]),
                const SizedBox(height: 30),
                _buildSkillRow('Languages', [
                  'assets/icons/dart.png',
                  'assets/icons/html.png',
                  'assets/icons/css.png',
                  'assets/icons/js.png',
                  'assets/icons/c++.png',
                  'assets/icons/py.png',
                  'assets/icons/php.png',
                ]),
                const SizedBox(height: 30),
                _buildSkillRow('Databases', [
                  'assets/icons/mysql.jpeg',
                  'assets/icons/mongo.png',
                ]),
                const SizedBox(height: 30),
                _buildSkillRow('Operating System', [
                  'assets/icons/windows.png',
                  'assets/icons/ubuntu.png',
                  'assets/icons/kali.png',
                ]),
                const SizedBox(height: 30),
                _buildSkillRow('Software', [
                  'assets/icons/codeblock.jpeg',
                  'assets/icons/vs.jpeg',
                  'assets/icons/oracle.png',
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildSkillRow(String title, List<String> iconPaths) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20, // Horizontal space between icons
          runSpacing: 20, // Vertical space between icons if wrapped
          children: iconPaths.map((path) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                path,
                width: 70, // Adjust size of icons as needed
                height: 70,
                fit: BoxFit.contain,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
