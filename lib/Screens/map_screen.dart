import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreenus extends StatefulWidget {
  @override
  _MapScreenusState createState() => _MapScreenusState();
}

class _MapScreenusState extends State<MapScreenus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BusMap'),
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
                center: LatLng(11.0168, 76.9558), // Coimbatore coordinates
                zoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(11.0168, 76.9558), // Example coordinates for the bus
                      builder: (ctx) => GestureDetector(
                        onTap: () => _showBusDetails(context),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blueAccent,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBusDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bus Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bus Number: 123'),
            Text('Driver: John Doe'),
            Text('Speed: 40 km/h'),
            Text('Location: Coimbatore'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
