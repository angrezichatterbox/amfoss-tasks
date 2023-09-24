import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late MapLatLng _markerPosition;
  late MapLatLng _currentLocation = MapLatLng(0.0, 0.0);
  late MapZoomPanBehavior _mapZoomPanBehavior;
  late MapTileLayerController _controller;
  String _distanceText = '';

  double _travelSpeed = 35;

  _MapSampleState() {

    Permission.locationWhenInUse.request().then((status) {

      if (status.isGranted) {
        Geolocator.getPositionStream().listen((position) {

          _currentLocation = MapLatLng(position.latitude, position.longitude);


          _markerPosition = _currentLocation;


          setState(() {});
        });
      } else {
        r
        print('The user denied the location permission.');
      }
    });
  }


  @override
  void initState() {
    _controller = MapTileLayerController();
    _mapZoomPanBehavior = MapZoomPanBehavior();
    _getCurrentLocation();
    super.initState();
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = MapLatLng(position.latitude, position.longitude);
        _mapZoomPanBehavior.focalLatLng = _currentLocation;
        _mapZoomPanBehavior.zoomLevel = 15;
        _distanceText = '';
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  double calculateDistance(MapLatLng from, MapLatLng to) {
    const double earthRadius = 6371.0;

    double fromLatRad = math.pi * from.latitude / 180.0;
    double fromLngRad = math.pi * from.longitude / 180.0;
    double toLatRad = math.pi * to.latitude / 180.0;
    double toLngRad = math.pi * to.longitude / 180.0;

    double latDiff = toLatRad - fromLatRad;
    double lngDiff = toLngRad - fromLngRad;

    double a = math.pow(math.sin(latDiff / 2), 2) +
        math.cos(fromLatRad) *
            math.cos(toLatRad) *
            math.pow(math.sin(lngDiff / 2), 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = earthRadius * c;

    return distance;
  }

  String formatHoursMinutes(double hours) {
    int totalMinutes = (hours * 60).toInt();
    int hoursPart = totalMinutes ~/ 60;
    int minutesPart = totalMinutes % 60;
    return '$hoursPart hours $minutesPart minutes';
  }

  void updateMarkerChange(Offset position) {
    _markerPosition = _controller.pixelToLatLng(position);
    if (_controller.markersCount > 0) {
      _controller.clearMarkers();
    }
    _controller.insertMarker(0);

    double distance = calculateDistance(_currentLocation, _markerPosition);
    double travelTime = distance / _travelSpeed;

    setState(() {
      _distanceText =
      'Distance: ${distance.toStringAsFixed(2)} kilometers\nTime: ${formatHoursMinutes(travelTime)}';
    });
  }


  Future<List<MapLatLng>> fetchPolylinePoints(MapLatLng origin, MapLatLng destination) async {
    final apiKey = '5b3ce3597851110001cf6248dc67b05295d14517adf274a26b856fd5';
    final apiUrl = 'https://api.openrouteservice.org/v2/directions/driving-car?';

    final response = await http.get(
      Uri.parse('$apiUrl'
          'api_key=$apiKey'
          '&start=${origin.longitude},${origin.latitude}'
          '&end=${destination.longitude},${destination.latitude}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedPoints = json.decode(response.body)['features'][0]['geometry']['coordinates'];
      final List<MapLatLng> polylinePoints = decodedPoints.map((point) {
        return MapLatLng(point[1], point[0]);
      }).toList();
      return polylinePoints;
    } else {
      throw Exception('Failed to load polyline points');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GeoQuest')),
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          updateMarkerChange(details.localPosition);
        },
        child: SfMaps(
          layers: [
            MapTileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              zoomPanBehavior: _mapZoomPanBehavior,
              initialFocalLatLng: _currentLocation,
              controller: _controller,
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: _markerPosition.latitude,
                  longitude: _markerPosition.longitude,
                  child: Icon(Icons.location_on, color: Colors.red),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Text(
          _distanceText,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {

            MapLatLng origin = _currentLocation;
            MapLatLng destination = _markerPosition;
            try {
              List<MapLatLng> polylinePoints = await fetchPolylinePoints(origin, destination);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    currentLocation: _currentLocation,
                    markerLocation: _markerPosition,
                    polylinePoints: polylinePoints,
                  ),
                ),
              );
            } catch (e) {
              print('Error fetching and displaying polyline: $e');
            }
          },
          child: Text('Find the route'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final MapLatLng currentLocation;
  final MapLatLng markerLocation;
  final List<MapLatLng> polylinePoints;

  SecondPage({
    required this.currentLocation,
    required this.markerLocation,
    required this.polylinePoints,
  });

  @override
  Widget build(BuildContext context) {

    final PolylinePoints polylinePointsDecoder = PolylinePoints();


    final List<MapLatLng> decodedPolylinePoints = polylinePoints.map((MapLatLng polylinePoint) =>
        MapLatLng(polylinePoint.latitude, polylinePoint.longitude)).toList();

    return Scaffold(
      appBar: AppBar(title: Text('ROUTE')),
      body: SfMaps(
        layers: [
          MapTileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            initialZoomLevel: 10,
            zoomPanBehavior: MapZoomPanBehavior(),
            initialFocalLatLng: currentLocation,
            initialMarkersCount: decodedPolylinePoints.length,
            markerBuilder: (BuildContext context, int index) {
              if (index == decodedPolylinePoints.length - 1) {
                return MapMarker(
                  latitude: markerLocation.latitude,
                  longitude: markerLocation.longitude,
                  child: Transform.translate(
                    offset: Offset(0.0, -8.0),
                    child: Icon(Icons.location_on, color: Colors.red, size: 30),
                  ),
                );
              } else {
                return MapMarker(
                  latitude: decodedPolylinePoints[index].latitude,
                  longitude: decodedPolylinePoints[index].longitude,
                  iconType: MapIconType.circle,
                  iconColor: Colors.white,
                  iconStrokeWidth: 2.0,
                  size: index == 0 ? Size(12.0, 12.0) : Size(8.0, 8.0),
                  iconStrokeColor: Colors.black,
                );
              }
            },
            sublayers: [
              MapPolylineLayer(
                polylines: {
                  MapPolyline(
                    points: decodedPolylinePoints,
                    color: Color.fromRGBO(0, 102, 255, 1.0),
                    width: 6.0,
                  ),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
