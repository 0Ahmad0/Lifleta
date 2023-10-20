import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import '/src/core/utils/color_manager.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  MapController controller = MapController(
    initMapWithUserPosition: true,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? areaName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          OSMFlutter(
            controller: controller,
            initZoom: 12,
            trackMyPosition: true,
            minZoomLevel: 8,
            maxZoomLevel: 18,
            stepZoom: 1.0,
            isPicker: true,
          ),
          Positioned(
            top: AppSize.s50,
            child: SizedBox(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(areaName?? 'Select Location'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () async {
                final GeoPoint selectedPoint = await controller.centerMap;
                getAreaName(selectedPoint.latitude, selectedPoint.longitude);
              },
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getAreaName(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final address = data['address'];
      final area = address['city'] ??
          address['village'] ??
          address['town'] ??
          address['county'] ??
          'غير معروف';
      print(address);
      setState(() {
        areaName = area;
      });
    } else {
      setState(() {
        areaName = 'غير معروف';
      });
    }
  }
}
/*
return SafeArea(
      child: OpenStreetMapSearchAndPick(
        zoomInIcon: Icons.add_circle_outline,
        zoomOutIcon: Icons.remove_circle_outline,
        buttonColor: Theme.of(context).primaryColor,
        locationPinIconColor: ColorManager.error,
        locationPinText: '',

        buttonText: tr(LocaleKeys.create_report_select_location),
        onPicked: (PickedData pickedData) {
          print(pickedData.address);
        },

      ),
    );
 */
/*--------------------------------*/
/*

 */