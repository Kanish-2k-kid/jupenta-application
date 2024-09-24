import 'package:flutter/material.dart';

class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isBusRunning = false; // Track if the bus is running
  bool _isButtonPressed = false; // Track if the button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Home", style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Card for Driver's Picture and Name
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Driver's Picture
                      CircleAvatar(
                        radius: 60, // Slightly smaller size
                        backgroundImage: AssetImage('assets/images/driver.jpg'), // Add driver's picture here
                      ),
                      SizedBox(height: 16),
                      // Driver's Name
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Bus Number
                      Text(
                        "Bus Number: 27",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      // Route
                      Text(
                        "Route: Irugur - Sulur",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              // Action Button
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBusRunning = !_isBusRunning;
                    _isButtonPressed = true;
                  });
                  Future.delayed(Duration(milliseconds: 200), () {
                    setState(() {
                      _isButtonPressed = false;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: 160, // Larger width
                  height: 160, // Larger height
                  decoration: BoxDecoration(
                    color: _isBusRunning ? Colors.red : Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isBusRunning ? Colors.redAccent : Colors.greenAccent,
                      width: 4,
                    ),
                    boxShadow: [
                      if (_isButtonPressed)
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.6),
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset: Offset(0, 0),
                        ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [_isBusRunning ? Colors.red : Colors.green, Colors.black12],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      _isBusRunning ? "Stop" : "Start",
                      style: TextStyle(
                        fontSize: 36, // Larger font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
