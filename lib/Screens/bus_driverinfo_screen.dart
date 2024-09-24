import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BusDriverInfoScreen extends StatefulWidget {
  @override
  _BusDriverInfoScreenState createState() => _BusDriverInfoScreenState();
}

class _BusDriverInfoScreenState extends State<BusDriverInfoScreen> {
  int _currentIndex = 0; // Track current index for the navigation bar
  bool _showNavBar = false; // Set to false to hide the nav bar on this screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Information", style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Driver's Picture
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/driver.jpg'), // Add driver's picture here
                      ),
                    ),
                    SizedBox(height: 12),
                    // Driver's Name
                    Center(
                      child: Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    // Driver's Age
                    Center(
                      child: Text(
                        "Age: 45",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Call Driver Section
                    _buildActionCard(
                      icon: Icons.phone,
                      color: Colors.green,
                      title: "Call Driver",
                      onTap: () {
                        // Add functionality to call the driver
                      },
                    ),
                    SizedBox(height: 8),
                    // Message Driver Section
                    _buildActionCard(
                      icon: Icons.message,
                      color: Colors.blue,
                      title: "Send Message",
                      onTap: () {
                        // Add functionality to send a message to the driver
                      },
                    ),
                    SizedBox(height: 8),
                    // Bus Number Section
                    _buildInfoCard(
                      icon: Icons.directions_bus,
                      color: Colors.orange,
                      title: "Bus Number: 27",
                    ),
                    SizedBox(height: 8),
                    // Current Speed Section
                    _buildInfoCard(
                      icon: Icons.speed,
                      color: Colors.blueGrey,
                      title: "Current Speed",
                      subtitle: "45 km/h",
                      subtitleStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    // Estimated Time of Arrival Section
                    _buildInfoCard(
                      icon: Icons.access_time,
                      color: Colors.red,
                      title: "Estimated Arrival Time",
                      subtitle: "7 minutes to your location",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _showNavBar ? CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.white,
        color: Colors.blue,
        height: 60,
        items: <Widget>[
          _buildNavBarItem(Icons.home, _currentIndex == 0 ? Colors.red : Colors.grey),
          _buildNavBarItem(Icons.map, _currentIndex == 1 ? Colors.deepPurpleAccent : Colors.grey),
          _buildNavBarItem(Icons.notifications, _currentIndex == 2 ? Colors.green : Colors.grey),
          _buildNavBarItem(Icons.directions_bus, _currentIndex == 3 ? Colors.blue : Colors.grey),
          _buildNavBarItem(Icons.help, _currentIndex == 4 ? Colors.orange : Colors.grey),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Optionally handle navigation or page changes here
        },
      ) : null, // Set to null to hide the nav bar
    );
  }

  Widget _buildActionCard({required IconData icon, required Color color, required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: color, size: 22),
        title: Text(title, style: TextStyle(fontSize: 16)),
        onTap: onTap,
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required Color color, required String title, String? subtitle, TextStyle? subtitleStyle}) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: color, size: 22),
        title: Text(title, style: TextStyle(fontSize: 16)),
        subtitle: subtitle != null ? Text(subtitle, style: subtitleStyle) : null,
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: 24,
          color: color,
        ),
      ),
    );
  }
}
