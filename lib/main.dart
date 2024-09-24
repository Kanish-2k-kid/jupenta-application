import 'package:trackmykid2/model/routes.dart';
import 'package:flutter/material.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/shared_navigation_bar.dart'; // Import the shared navigation bar

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: welcomeScreen(), // Set SharedNavigationBar as the home
    );
  }
}
