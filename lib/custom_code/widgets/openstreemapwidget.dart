// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart'; // Ensure package is installed
import 'package:latlong2/latlong.dart' as latlong2; // Alias the latlong2 LatLng
import 'package:house_hoteling/flutter_flow/lat_lng.dart'
    as flutterFlowLatLng; // Alias FlutterFlow LatLng

class Openstreemapwidget extends StatefulWidget {
  const Openstreemapwidget({
    super.key,
    this.width,
    this.height,
    this.latlong = const flutterFlowLatLng.LatLng(33.694127, 73.066508),
    this.zoom = 20,
  });

  final double? width;
  final double? height;
  final LatLng latlong;
  final int zoom;

  @override
  State<Openstreemapwidget> createState() => _OpenstreemapwidgetState();
}

class _OpenstreemapwidgetState extends State<Openstreemapwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: latlong2.LatLng(widget.latlong.latitude,
              widget.latlong.longitude), // Non-nullable
          initialZoom: widget.zoom.toDouble(), // Convert int to double safely
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
