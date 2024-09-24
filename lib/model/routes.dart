import 'package:flutter/material.dart';
import 'package:trackmykid2/Screens/welcome_screen.dart';
import 'package:trackmykid2/Screens/login_screen.dart';
import 'package:trackmykid2/Screens/shared_navigation_bar.dart';
import 'package:trackmykid2/Screens/user_navigation_screen.dart';
import 'package:trackmykid2/Screens/map_screen.dart';
import 'package:trackmykid2/Screens/bus_driverinfo_screen.dart';
import 'package:trackmykid2/Screens/user_help_screen.dart';
import 'package:trackmykid2/Screens/notification_management_screen.dart';

// Define your routes
const String welcomeRoute = "/welcome";
const String loginRoute = "/login";
const String userNavigationRoute = "/userNavigation";
const String mapRoute = "/map";
const String notificationRoute = "/notification";
const String busDriverInfoRoute = "/busDriverInfo";
const String userHelpRoute = "/userHelp";

// Define the route map
final routes = {
  welcomeRoute: (context) => welcomeScreen(), // Make sure you have a WelcomeScreen defined
  loginRoute: (context) => LoginScreen(),
  userNavigationRoute: (context) => UserNavigationScreen(),
  mapRoute: (context) => MapScreenus(),
  notificationRoute: (context) => NotificationManagementScreen(),
  busDriverInfoRoute: (context) => BusDriverInfoScreen(),
  userHelpRoute: (context) => UserHelpScreen(),
};
