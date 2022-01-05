import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:oyelabs/providers/address_provider.dart';
import 'package:oyelabs/widgets/button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}


class _LocationScreenState extends State<LocationScreen> {
  String location = '';
  String address = '';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddress(Position position) async{
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address = '${place.street},${place.subLocality},${place.administrativeArea},${place.country}';
    context.read<AddressProvider>().setAddress(address);
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/location/location.png',
                width: size.width * 0.8,
              )),
          SizedBox(height: size.height / 14),
          GestureDetector(
              onTap: () async{
                Position position = await _determinePosition();
                GetAddress(position);
              },
              child: LocationButton('Your current location', Colors.black,
                  'assets/location/gps.png', Colors.white)),
          SizedBox(height: size.height / 50),
          LocationButton('Some other location', Colors.white,
              'assets/location/search.png', Color(0xFFA1A4B2)),
        ],
      ),
    );
  }
}
