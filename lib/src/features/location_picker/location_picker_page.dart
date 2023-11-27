import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../../common_widgets/constans.dart';
import '../../core/routing/app_router.dart';
import '../../core/utils/values_manager.dart';

class LocationPickerPage extends StatefulWidget {
  @override
  _LocationPickerPageState createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  String? areaName;

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
              });
            },
            onTap: (LatLng latLng) async {
              Const.loading(context);
              await getAreaName(latLng.latitude, latLng.longitude);
              goRouter.pop();
              setState(() {
                selectedLocation = latLng;
              });
            },
            markers: Set.from([
              if (selectedLocation != null)
                Marker(
                  markerId: MarkerId('selected-location'),
                  position: selectedLocation!,
                  icon: BitmapDescriptor.defaultMarker,
                ),
            ]),
            initialCameraPosition: CameraPosition(
              target: LatLng(24.7136, 46.6753),
              zoom: 12.0,
            ),
          ),
          Positioned(
            top: AppSize.s50,
            child: SizedBox(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(areaName ?? 'Select Location'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () async {
                goRouter.pop(areaName);
                // final GeoPoint selectedPoint = await controller.centerMap;
                // getAreaName(selectedPoint.latitude, selectedPoint.longitude);
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
      final area = address['suburb'] ??
          address['municipality'] ??
          address['province'] ??
          address['state'] ??
          address['country'] ??
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
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:lifleta/src/common_widgets/constans.dart';
import 'package:lifleta/src/core/utils/assets_manager.dart';
import 'package:lifleta/src/core/utils/values_manager.dart';
import '../../core/routing/app_router.dart';
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
@override
  void initState() {
  controller;
    super.initState();
  }
  String? areaName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Listener(
            onPointerUp: (move) async {
              Const.loading(context);
              final GeoPoint selectedPoint = await controller.centerMap;
               await getAreaName(selectedPoint.latitude, selectedPoint.longitude);
              goRouter.pop();
            },
            child:  OSMFlutter(
              controller: controller,
              initZoom: 12,
              trackMyPosition: true,
              minZoomLevel: 8,
              maxZoomLevel: 18,
              stepZoom: 1.0,
              isPicker: true,
            ),
          )
         ,
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
                goRouter.pop(areaName);
                // final GeoPoint selectedPoint = await controller.centerMap;
                // getAreaName(selectedPoint.latitude, selectedPoint.longitude);
              },
              child: const Icon(Icons.my_location),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       final GeoPoint selectedPoint = await controller.centerMap;
          //       getAreaName(selectedPoint.latitude, selectedPoint.longitude);
          //     },
          //     child: const Icon(Icons.my_location),
          //   ),
          // ),
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
      final area = address['suburb'] ??
          address['municipality'] ??
          address['province'] ??
          address['state'] ??
          address['country'] ??
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
 */
