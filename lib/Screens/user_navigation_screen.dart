import 'package:flutter/material.dart';
import 'dart:async';

class UserNavigationScreen extends StatefulWidget {
  @override
  _UserNavigationScreenState createState() => _UserNavigationScreenState();
}

class _UserNavigationScreenState extends State<UserNavigationScreen> {
  String greeting = 'Good Day, Kanish';

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        greeting = getGreeting();
      });
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning, Kanish';
    } else if (hour < 16) {
      return 'Good Afternoon, Kanish';
    } else {
      return 'Good Evening, Kanish';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('User Navigation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(
                'assets/images/plantbg.png',
                height: 450,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              greeting,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('School Name: Adharsh Vidhyalaya', style: TextStyle(fontSize: 21)),
                SizedBox(height: 8),
                Text('Class: 12-B2', style: TextStyle(fontSize: 21)),
                SizedBox(height: 8),
                Text('Bus Number: 27', style: TextStyle(fontSize: 21)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
