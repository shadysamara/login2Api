import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/services/api_provider.dart';
import 'package:login_api/services/sharedprefrences_helper.dart';
import 'package:login_api/ui/pages/all_users_page.dart';
import 'package:login_api/ui/pages/page_not_found.dart';
import 'package:login_api/ui/pages/user_details.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoder/geocoder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.spHelper.initSharedPrefrences();
  runApp(ChangeNotifierProvider<ApiProvider>(
    create: (context) => ApiProvider(),
    child: MaterialApp(
      routes: {
        '/': (context) => MyApp(),
        AllUsersPage.routeName: (context) => AllUsersPage(),
      },
      onGenerateRoute: (settings) {
        String routeName = settings.name;
        User user = settings.arguments;
        if (routeName == UserDetailsPage.routeName) {
          return MaterialPageRoute(builder: (context) => UserDetailsPage(user));
        } else {
          return MaterialPageRoute(builder: (context) => PageNotFound());
        }
      },
    ),
  ));
}

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0)).then((value) {
      Navigator.pushReplacementNamed(context, AllUsersPage.routeName);
    });
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(31.41636482764028, 34.37122642993927);
  Set<Marker> markers = {};
  LatLng basemLocation;
  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        zoom: 12, target: LatLng(position.latitude, position.longitude))));
  }

  void launchMap() async {
    const url = "https://wa.me/972599015201/?text=hello how are you";
    if (await canLaunch(url)) {
      launch(url);
    } else {
      print("Could not launch");
      throw 'Could not launch Maps';
    }
  }

  getGocoderInfo(LatLng latLng) async {
    List<Address> addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(latLng.latitude, latLng.longitude));
    Address address = addresses.first;
    // print(address.addressLine);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchMap();
          },
          child: Icon(Icons.location_on),
        ),
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: [
            GoogleMap(
              onCameraMove: (cameraPosition) {
                basemLocation = cameraPosition.target;
              },
              markers: markers,
              onTap: (x) {
                getGocoderInfo(x);
                // MapsLauncher.launchCoordinates(x.latitude, x.longitude);
                // mapController.animateCamera(CameraUpdate.newCameraPosition(
                //     CameraPosition(target: x, zoom: 15)));
                // markers.add(Marker(
                //   markerId: MarkerId('${x.latitude}x${x.longitude}'),
                //   position: x,
                // ));
                // setState(() {});
              },
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            Positioned.fill(
                child: Center(
              child: Icon(
                Icons.location_pin,
                size: 40,
                color: Colors.red,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
