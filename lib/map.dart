import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'footer_page.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late LatLng currentLocation = LatLng(0, 0); // Initialize with default value
  bool locationPermissionDenied = false;
  String locationName = 'กำลังโหลดตำแหน่งปัจจุบัน'; // Default location name

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    Widget mapWidget;
    if (currentLocation.latitude != 0 && currentLocation.longitude != 0) {
      // If location permission is granted and current location is available, load the map
      mapWidget = GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 13.0,
        ),
        markers: _createMarkers(),
        circles: _createCircles(), // Add circles to the map
        onTap: (_) {},
      );
    } else {
      // Otherwise, show loading indicator or other placeholder
      mapWidget = Center(
        child: CircularProgressIndicator(), // Placeholder for loading indicator
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_outlined),
          onPressed: () {
            GoRouter.of(context).go('/firstpage');
          },
        ),
        title: Text(locationName),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              GoRouter.of(context).go('/notification');
            },
          ),
        ],
      ),
      body: mapWidget,
      bottomNavigationBar: FooterPage(
        selectedIndex: 3,
        onItemTapped: (index) {},
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _createMarkers() {
    return <Marker>[
      Marker(
        markerId: MarkerId('restaurantMarker'),
        position: LatLng(13.800233627797933, 100.32752842932481),
        onTap: () {
          _showCustomInfoWindow(context);
        },
      ),
    ].toSet();
  }

  Set<Circle> _createCircles() {
    return <Circle>[
      Circle(
        circleId: CircleId('currentLocationCircle'),
        center: currentLocation, // Use the current user location
        radius: 100, // Radius of the circle (in meters)
        fillColor: Colors.blue.withOpacity(0.2), // Color of the circle (transparent blue)
        strokeWidth: 2, // Width of the circle's outline
        strokeColor: Colors.blue, // Color of the circle's outline
      ),
    ].toSet();
  }

  void _showCustomInfoWindow(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CustomInfoWindow(
          title: 'ร้านอาหารที่ 1',
          snippet: 'เวลาทำการ จ. - ศ. 10:00 - 20:00',
          imageUrl: 'assets/img/foods/food.jpg',
        ),
      ),
    );
  }

  void _checkLocationPermission() {
    _getCurrentLocation(
      (Position position, String placeName) {
        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
          locationName = placeName;
        });
      },
      (dynamic error) {
        // Handle error: display error message or take appropriate action
        print('Error getting current location: $error');
        setState(() {
          locationPermissionDenied = true;
        });
      },
    );
  }

  void _getCurrentLocation(
      Function(Position, String) onSuccess, Function(dynamic) onError) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        onError('Location services are disabled');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          onError('Location permission denied');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        onError('Location permission permanently denied');
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      String placeName = placemarks.isNotEmpty
          ? placemarks[0].name ?? 'ไม่พบชื่อสถานที่'
          : 'ไม่พบชื่อสถานที่';

      onSuccess(position, placeName);
    } catch (e) {
      onError('Failed to get current location: $e');
    }
  }
}

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String snippet;
  final String imageUrl;

  const CustomInfoWindow({
    required this.title,
    required this.snippet,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 225,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/restaurant');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        snippet,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
