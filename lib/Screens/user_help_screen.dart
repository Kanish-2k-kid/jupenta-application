import 'package:flutter/material.dart';
// Make sure to import your shared navigation bar file
import 'shared_navigation_bar.dart'; // Update this to the correct path if necessary

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserHelpScreen(),
    );
  }
}

class UserHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.blue, // Blue theme color
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Introduction',
              icon: Icons.info_outline,
              iconColor: Colors.blue,
              content: Text(
                'Welcome to the Help & Support page. Here you can find answers to common questions and get support for any issues you might encounter.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'FAQs',
              icon: Icons.question_answer,
              iconColor: Colors.green,
              content: Text(
                'Frequently Asked Questions will be listed here.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'Troubleshooting Guides',
              icon: Icons.build,
              iconColor: Colors.orange,
              content: Text(
                'Troubleshooting guides will be provided here.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'How-To Guides',
              icon: Icons.help_outline,
              iconColor: Colors.purple,
              content: Text(
                'How-To guides will be available here.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'User Manual',
              icon: Icons.book,
              iconColor: Colors.red,
              content: ElevatedButton(
                onPressed: () {
                  // Add action to download or view the user manual
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue theme color
                  foregroundColor: Colors.white, // Text color
                ),
                child: Text('Download User Manual'),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'Feedback',
              icon: Icons.feedback,
              iconColor: Colors.teal,
              content: ElevatedButton(
                onPressed: () {
                  // Add action to open feedback form
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue theme color
                  foregroundColor: Colors.white, // Text color
                ),
                child: Text('Submit Feedback'),
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'Contact Us',
              icon: Icons.contact_mail,
              iconColor: Colors.blueGrey,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'For further assistance, you can contact us at:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: support@example.com',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Phone: +123-456-7890',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildSection(
              title: 'Related Resources',
              icon: Icons.link,
              iconColor: Colors.cyan,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add action to open the website
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue, // Text color
                    ),
                    child: Text('Visit Our Website'),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Add action to open community forums
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue, // Text color
                    ),
                    child: Text('Join Community Forums'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Blue theme color
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}
