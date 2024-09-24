import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationManagementScreen extends StatefulWidget {
  @override
  _NotificationManagementScreenState createState() => _NotificationManagementScreenState();
}

class _NotificationManagementScreenState extends State<NotificationManagementScreen> {
  LatLng _homePosition = LatLng(11.0168, 76.9558); // Home location
  LatLng _schoolPosition = LatLng(11.0220, 76.9500); // School location
  List<LatLng> _routePoints = [];
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _fetchRoute(); // Fetch the route when the screen initializes
  }

  Future<void> _fetchRoute() async {
    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?start=${_homePosition.longitude},${_homePosition.latitude}&end=${_schoolPosition.longitude},${_schoolPosition.latitude}'),
      headers: {
        'Authorization': 'YOUR_API_KEY', // Replace with your API key
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> coordinates = data['routes'][0]['geometry']['coordinates'];
      print('Route Coordinates: $coordinates'); // Debugging statement
      setState(() {
        _routePoints = coordinates
            .map((coord) => LatLng(coord[1], coord[0])) // Convert the coordinates to LatLng
            .toList();
      });
    } else {
      print('Error: ${response.statusCode} - ${response.body}'); // Debugging statement
    }
  }

  void _showLocationDialog(BuildContext context, String title, LatLng position) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController latController = TextEditingController(text: position.latitude.toString());
        TextEditingController lngController = TextEditingController(text: position.longitude.toString());

        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: latController,
                decoration: InputDecoration(labelText: 'Latitude'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: lngController,
                decoration: InputDecoration(labelText: 'Longitude'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (title == 'Change Home Location') {
                    _homePosition = LatLng(double.parse(latController.text), double.parse(lngController.text));
                  } else {
                    _schoolPosition = LatLng(double.parse(latController.text), double.parse(lngController.text));
                  }
                  _fetchRoute(); // Fetch the route again after updating locations
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Map'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Bus Number: 123',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(11.0180, 76.9520), // Adjusted for better visibility
                zoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // OSM tile layer
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _homePosition,
                      builder: (ctx) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pin_drop, color: Colors.green, size: 50),
                          Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _schoolPosition,
                      builder: (ctx) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.pin_drop, color: Colors.red, size: 50),
                          Text('School Stop', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      color: Colors.blue,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildUserOptions(),
        ],
      ),
    );
  }

  Widget _buildUserOptions() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change Home Location"),
              ElevatedButton(
                onPressed: () => _showLocationDialog(context, 'Change Home Location', _homePosition),
                child: Text("Edit"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change School Location"),
              ElevatedButton(
                onPressed: () => _showLocationDialog(context, 'Change School Location', _schoolPosition),
                child: Text("Edit"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notifications"),
              Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
