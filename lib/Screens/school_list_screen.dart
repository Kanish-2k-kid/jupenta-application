import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:page_transition/page_transition.dart';
import 'login_screen.dart'; // Import the LoginScreen file

class SchoolListScreen extends StatefulWidget {
  @override
  _SchoolListScreenState createState() => _SchoolListScreenState();
}

class _SchoolListScreenState extends State<SchoolListScreen> {
  final List<Map<String, dynamic>> imgList = [
    {
      'image': 'assets/images/S1.jpeg',
      'names': ['Sri Mandhir', 'sri_mandhir', 'SriMandhir'],
    },
    {
      'image': 'assets/images/S2.png',
      'names': ['Gandhi School', 'gandhi_school', 'GandhiSchool'],
    },
    {
      'image': 'assets/images/S3.jpeg',
      'names': ['Sunrise Academy', 'sunrise_academy', 'SunriseAcademy'],
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filteredList = imgList
        .where((school) {
      final String schoolName = school['names'].join(' ').toLowerCase();
      return schoolName.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Select Your School',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    // Search Field
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.blueAccent.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              // School List
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return GlowButton(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              filteredList[index]['image'],
                              fit: BoxFit.cover,
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          filteredList[index]['names'][0],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.scale,
                          duration: Duration(milliseconds: 500),
                          alignment: Alignment.center, // Required alignment
                          child: LoginScreen(), // Navigate to LoginScreen
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlowButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const GlowButton({required this.child, required this.onPressed});

  @override
  _GlowButtonState createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      child: GlowContainer(
        glowColor: isPressed ? Colors.blueAccent : Colors.transparent,
        color: Colors.transparent,
        child: widget.child,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

// Removed SchoolDetailsScreen as it's no longer needed.
