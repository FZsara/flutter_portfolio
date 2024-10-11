import 'package:flutter/material.dart';
import 'contact_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
            // Wrap in a Container to control width
            SizedBox(
              width:
                  screenSize.width * 0.5, // Set a width for the scrolling area
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _navButton(context, 'About me', '/personal_info'),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    // Use Expanded to avoid overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, I\'m Fariha Zannat',
                          style: TextStyle(
                            fontSize: screenSize.width > 600 ? 32 : 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Flutter & Web Developer',
                          style: TextStyle(
                            fontSize: screenSize.width > 600
                                ? 24
                                : 18, // Smaller size
                            color: Colors.orangeAccent,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10), // Add some spacing
                        Text(
                          'Passionate mobile app and website developer,to create beautiful & user-friendly UI!',
                          style: TextStyle(
                            fontSize: screenSize.width > 600
                                ? 20
                                : 16, // Smaller size
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left, // Align to the left
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.orangeAccent, // Button background color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                          child: const Text(
                            'Download CV',
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  Colors.black, // Text color changed to black
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Rectangular image
                  SizedBox(
                    height: screenSize.width > 600 ? 300 : 200,
                    child: Image.asset(
                      'assets/images/fz.jpg', // Add your image asset
                      height: screenSize.width > 600 ? 300 : 200,
                      fit: BoxFit.cover, // Maintain aspect ratio
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const ContactForm(),
          ],
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
}
