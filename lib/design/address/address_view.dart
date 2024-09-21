import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class AddressView extends StatefulWidget {
  AddressView({super.key});

  static const routeName = '/address';
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  double lat = -7.775066271424891;
  double long = 110.39516017150076;

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat'),
        centerTitle: true,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          maxZoom: 17.0,
          initialCenter: LatLng(lat, long),
          interactionOptions: InteractionOptions(
            flags: ~InteractiveFlag.rotate,
          ),
          onTap: (tapPosition, point) {
            setState(() {
              lat = point.latitude;
              long = point.longitude;
              _mapController.move(point, 17.0);
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            rotate: true,
            alignment: Alignment.center,
            markers: [
              Marker(
                child: const Icon(Icons.location_on_outlined),
                width: 80.0,
                height: 80.0,
                point: LatLng(lat, long),
              )
            ],
          ),
          const RichAttributionWidget(
            // Include a stylish prebuilt attribution widget that meets all requirments
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
              ),
              // Also add images...
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: SizedBox(
          height: 52,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AddressView.routeName,
              );
            },
            child: const Text(
              'Boking Sekarang',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
