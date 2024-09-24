import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:trackmykid2/Screens/user_navigation_screen.dart';
import 'package:trackmykid2/Screens/map_screen.dart';
import 'package:trackmykid2/Screens/notification_management_screen.dart';
import 'package:trackmykid2/Screens/bus_driverinfo_screen.dart';
import 'package:trackmykid2/Screens/user_help_screen.dart';

class SharedNavigationBar extends StatefulWidget {
  @override
  _SharedNavigationBarState createState() => _SharedNavigationBarState();
}

class _SharedNavigationBarState extends State<SharedNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    UserNavigationScreen(),
    MapScreenus(), // Ensure this screen is defined
    NotificationManagementScreen(),
    BusDriverInfoScreen(),
    UserHelpScreen(),
  ];

  Color _getBackgroundColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue.withOpacity(0.2); // Light shade of blue
      case 1:
        return Colors.deepPurpleAccent.withOpacity(0.2); // Light shade of deep purple
      case 2:
        return Colors.green.withOpacity(0.2); // Light shade of green
      case 3:
        return Colors.red.withOpacity(0.2); // Light shade of red
      case 4:
        return Colors.orange.withOpacity(0.2); // Light shade of orange
      default:
        return Colors.grey.withOpacity(0.2); // Default light shade
    }
  }

  Color _getButtonBackgroundColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue.withOpacity(0.2); // Background color for Home icon
      case 1:
        return Colors.deepPurpleAccent.withOpacity(0.2); // Background color for Map icon
      case 2:
        return Colors.green.withOpacity(0.2); // Background color for Notifications icon
      case 3:
        return Colors.red.withOpacity(0.2); // Background color for Bus icon
      case 4:
        return Colors.orange.withOpacity(0.2); // Background color for Help icon
      default:
        return Colors.grey; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: _getButtonBackgroundColor(_currentIndex),
        color: Colors.blue,
        height: 60,
        items: <Widget>[
          _buildNavBarItem(Icons.home, 0),
          _buildNavBarItem(Icons.map, 1),
          _buildNavBarItem(Icons.notifications, 2),
          _buildNavBarItem(Icons.directions_bus, 3),
          _buildNavBarItem(Icons.help, 4),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    Color iconColor = _currentIndex == index ? iconColorForIndex(index) : Colors.grey; // Color of the icon
    Color backgroundColor = _getBackgroundColor(index); // Light shade background color

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 30, color: iconColor),
    );
  }

  Color iconColorForIndex(int index) {
    switch (index) {
      case 0:
        return Colors.blue; // Original color for Home icon
      case 1:
        return Colors.deepPurpleAccent; // Original color for Map icon
      case 2:
        return Colors.green; // Original color for Notifications icon
      case 3:
        return Colors.red; // Original color for Bus icon
      case 4:
        return Colors.orange; // Original color for Help icon
      default:
        return Colors.grey; // Default color
    }
  }
}
