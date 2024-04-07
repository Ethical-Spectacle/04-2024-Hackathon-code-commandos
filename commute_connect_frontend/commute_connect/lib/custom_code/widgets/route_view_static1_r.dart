// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'dart:math' show cos, sqrt, asin;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;

class RouteViewStatic1R extends StatefulWidget {
  const RouteViewStatic1R({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? height;
  final double? width;
  @override
  _RouteViewStaticState createState() => _RouteViewStaticState();
}

class _RouteViewStaticState extends State<RouteViewStatic1R> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;

  String? _placeDistance;
  Set<Marker> markers = {};

  PolylinePoints? polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<latlng.LatLng> polylineCoordinates = [];

  String get googleMapsApiKey {
    if (kIsWeb) {
      return 'AIzaSyAJJUBPPVQ7RO_qqn5hAaxBJW1wxokI7Ts';
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return 'AIzaSyAJJUBPPVQ7RO_qqn5hAaxBJW1wxokI7Ts';
      case TargetPlatform.android:
        return 'AIzaSyAJJUBPPVQ7RO_qqn5hAaxBJW1wxokI7Ts';
      default:
        return 'AIzaSyAJJUBPPVQ7RO_qqn5hAaxBJW1wxokI7Ts';
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    setState(() {
      if (markers.isNotEmpty) markers.clear();
      if (polylines.isNotEmpty) polylines.clear();
      if (polylineCoordinates.isNotEmpty) polylineCoordinates.clear();
      _placeDistance = null;
    });

    try {
      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      // double startLatitude = 40.48017307700204;
      // double startLongitude = -3.3618026599287987;

      // double destinationLatitude = 40.484000837597925;
      // double destinationLongitude = -3.369978368282318;

      // Set 1: New York, USA
      double startLatitude1 = 33.42778514749298;
      double startLongitude1 = -111.94086034605269;
      double destinationLatitude1 = 33.306215432072534;
      double destinationLongitude1 = -111.67849161350222;

      String sc1 = '($startLatitude1, $startLongitude1)';
      String dc1 = '($destinationLatitude1, $destinationLongitude1)';

      // Start Location Marker
      Marker sm1 = Marker(
        markerId: MarkerId(sc1),
        position: latlng.LatLng(startLatitude1, startLongitude1),
        infoWindow: InfoWindow(
          title: 'Start $sc1',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker dm1 = Marker(
        markerId: MarkerId(dc1),
        position: latlng.LatLng(destinationLatitude1, destinationLongitude1),
        infoWindow: InfoWindow(
          title: 'Destination $dc1',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers.add(sm1);
      markers.add(dm1);

      debugPrint(
        'MAP::START COORDINATES: ($startLatitude1, $startLongitude1)',
      );
      debugPrint(
        'MAP::DESTINATION COORDINATES: ($destinationLatitude1, $destinationLongitude1)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude1 <= destinationLatitude1)
          ? startLatitude1
          : destinationLatitude1;
      double minx = (startLongitude1 <= destinationLongitude1)
          ? startLongitude1
          : destinationLongitude1;
      double maxy = (startLatitude1 <= destinationLatitude1)
          ? destinationLatitude1
          : startLatitude1;
      double maxx = (startLongitude1 <= destinationLongitude1)
          ? destinationLongitude1
          : startLongitude1;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: latlng.LatLng(northEastLatitude, northEastLongitude),
            southwest: latlng.LatLng(southWestLatitude, southWestLongitude),
          ),
          60.0,
        ),
      );

      await _createPolylines(startLatitude1, startLongitude1,
          destinationLatitude1, destinationLongitude1, Colors.black);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      _placeDistance = totalDistance.toStringAsFixed(2);
      debugPrint('MAP::DISTANCE: $_placeDistance km');
      FFAppState().routeDistance = '$_placeDistance km';

      var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude1,$destinationLongitude1&origins=$startLatitude1,$startLongitude1&key=$googleMapsApiKey',
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        final String durationText =
            jsonResponse['rows'][0]['elements'][0]['duration']['text'];
        debugPrint('MAP::$durationText');
        FFAppState().routeDuration = '$durationText';
      } else {
        debugPrint('ERROR in distance matrix API');
      }

      setState(() {});

      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      Color lineColor) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
      googleMapsApiKey, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    debugPrint('MAP::STATUS: ${result.status}');
    debugPrint('MAP::POLYLINES: ${result.points.length}');

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: lineColor,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    final startCoordinate =
        latlng.LatLng(33.42778514749298, -111.94086034605269);
    _initialLocation = CameraPosition(
      target: startCoordinate,
      zoom: 14,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: GoogleMap(
        markers: Set<Marker>.from(markers),
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          _calculateDistance();
        },
      ),
    );
  }
}
