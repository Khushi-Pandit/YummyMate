import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodapp/Homescreen.dart';
import 'package:location/location.dart';

class LocationAccess extends StatefulWidget {
  const LocationAccess({super.key});

  @override
  State<LocationAccess> createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  bool _locationRequestedWhileUsingApp = false;
  bool _locationRequestedOnlyThisTime = false;
  Location location = Location();

  Future<void> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Location services are not enabled
        return;
      }
    }

    // Request location permissions if not granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Permission not granted
        return;
      }
    }

    // Fetch location data
    _locationData = await location.getLocation();
    print("Location: ${_locationData.latitude}, ${_locationData.longitude}");
    // Use `_locationData` as needed
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Center(
        child: Card(
          elevation: 15,
          margin: EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              gradient: LinearGradient(
                colors: [
                  // Color(0xFFFFF4F5),
                  // Color(0xFFFFF4F5),
                  Colors.white,
                  Colors.white
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined, // Icon you want to use
                  color: Colors.blue, // Color of the icon
                  size: 35.0, // Size of the icon
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: 'Allow ',
                    style: GoogleFonts.roboto(fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'YummyMate',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text:
                              ' to access this device\'s approximate location?'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/Location.gif',
                    fit: BoxFit.contain,
                    width: 200,
                    height: 150,
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
    if (!_locationRequestedWhileUsingApp) {
    _locationRequestedWhileUsingApp = true;
    _getLocation();
                      } else {
          print("Location already accessed 'While Using the App'.");
          }
                      },
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'While Using the App',
                        style: GoogleFonts.roboto(fontSize: 16,color: Colors.blueAccent,fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (!_locationRequestedOnlyThisTime) {
                          _locationRequestedOnlyThisTime = true;
                          _getLocation();
                        } else {
                          print("Location already accessed 'Only This Time'.");
                        }
                      },
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Only This Time',
                        style: GoogleFonts.roboto(fontSize: 16,color: Colors.blueAccent,fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                      },
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Not Now',
                        style: GoogleFonts.roboto(fontSize: 16,color: Colors.blueAccent,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
