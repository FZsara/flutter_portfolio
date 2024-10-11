import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 100),//whole form size
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12, // Background color for the box
          borderRadius: BorderRadius.circular(15), // Rounded corners
          border: Border.all(color: Colors.orangeAccent, width: 2), // Orange border
        ),
        padding: const EdgeInsets.all(10), // Padding inside the box
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                filled: true,
                fillColor: Colors.grey, // Grey fill color for input fields
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                filled: true,
                fillColor: Colors.grey, // Grey fill color for input fields
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.grey, // Grey fill color for input fields
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Message',
                filled: true,
                fillColor: Colors.grey, // Grey fill color for input fields
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners for button
                ),
              ),
              child: const Text(
                'Send Message',
                style: TextStyle(
  fontSize: 18, // Increased font size
  fontWeight: FontWeight.bold, // Bold text
  color: Colors.black, 
),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
